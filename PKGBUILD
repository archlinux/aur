# Maintainer: Rubin Simons <me@rubin55.org>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=cypher-shell
pkgver="2025.11.2"
pkgrel=1
pkgdesc="A command line shell where you can execute Cypher against an instance of Neo4j"
arch=('any')
url="https://github.com/neo4j/${pkgname}"
license=('GPL3')
_java_version=21
depends=("java-runtime>=$_java_version" "neo4j-community=$pkgver")
source=(
  "https://dist.neo4j.org/neo4j-community-${pkgver}-unix.tar.gz"
  "wrapper.sh"
)
# https://dist.neo4j.org/neo4j-community-${pkgver}-unix.tar.gz.sha256
sha256sums=('0b9b8155d366ae64ed7c21e208b42be15da231c2f8040f9f745885aab43ee76a'
            '9454c1c0b17ea9dd243e96914067c7d238bd1c97a389c5ffad2dda13db6a94c8')

package() {
    mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/neo4j/bin $pkgdir/usr/share/neo4j/lib
    install -Dm755 $srcdir/wrapper.sh $pkgdir/usr/bin/${pkgname}
    install -Dm755 $srcdir/neo4j-community-${pkgver}/bin/${pkgname} $pkgdir/usr/share/neo4j/bin/${pkgname}
    install -Dm644 $srcdir/neo4j-community-${pkgver}/lib/${pkgname}-${pkgver}.jar $pkgdir/usr/share/neo4j/lib/${pkgname}-${pkgver}.jar
}
