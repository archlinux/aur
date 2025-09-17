# Maintainer: Glucy2 <glucy-2@outlook.com>
# Contributor: rubin55 <me@rubin55.org>

_pkgname=neo4j-community
pkgname=${_pkgname}-bin
pkgver="2025.08.0"
pkgrel=2
pkgdesc='A fully transactional graph database implemented in Java (binary package)'
license=('GPL-3.0-only')
arch=('any')
url="https://github.com/neo4j/neo4j"
_min_java_version=21
depends=("java-runtime>=$_min_java_version" "psmisc")
provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" neo4j-enterprise)
source=(
    "https://dist.neo4j.org/deb/neo4j_${pkgver}_all.deb"
    "neo4j.sysusers"
    "neo4j.tmpfiles"
)
# https://dist.neo4j.org/deb/neo4j_${pkgver}_all.deb.sha256
sha256sums=(
    '21c859363fe144714838d07dc6c9b3443dc345959324de39f4a3ccfb9355356e'
    '440874201629f436b3817be05d7f8240c9bef603a11dc0a125634287c0376b5d'
    'a4a12084b93c357adfc54d1c0736d710ff507418824e08e33cc1f30bdc8a67f8'
)

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "$srcdir/neo4j.sysusers" "$pkgdir/usr/lib/sysusers.d/neo4j.conf"
    install -Dm644 "$srcdir/neo4j.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/neo4j.conf"
}
