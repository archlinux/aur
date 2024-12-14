_pkgname=neo4j-community
pkgname=${_pkgname}-bin
pkgver="5.26.0"
pkgrel=1
pkgdesc='A fully transactional graph database implemented in Java (binary package)'
license=('GPL-3.0-only')
arch=('any')
url="https://github.com/neo4j/neo4j"
_java_version=17
depends=("java-runtime=$_java_version")
provides=("${_pkgname}")
conflicts=("${_pkgname}" neo4j-enterprise)
source=(
    "https://dist.neo4j.org/deb/neo4j_${pkgver}_all.deb"
    "neo4j.sysusers"
    "neo4j.tmpfiles"
)
# https://neo4j.com/wp-content/get_checksum.php?q=deb/neo4j_${pkgver}_all.deb.sha256
sha256sums=(
    '23c20768284e0dfc18b35a7f2fae47bb3b5182d0abf5ad2c334c49a8f5d8495a'
    '440874201629f436b3817be05d7f8240c9bef603a11dc0a125634287c0376b5d'
    'a4a12084b93c357adfc54d1c0736d710ff507418824e08e33cc1f30bdc8a67f8'
)

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "$pkgdir/lib" "$pkgdir/usr"
    install -Dm644 "$srcdir/neo4j.sysusers" "$pkgdir/usr/lib/sysusers.d/neo4j.conf"
    install -Dm644 "$srcdir/neo4j.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/neo4j.conf"
}
