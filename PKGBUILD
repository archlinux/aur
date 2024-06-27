# Maintainer: Guoyi Zhang <guoyi zhang at malacology dot net>
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
_pkgname=picard
pkgver=3.2.0
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(any)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=17')
makedepends=('ant' 'git' 'java-environment=17')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('9c6e1cbc077ece20c8996ba107b93b144847557187e50efd792f8bf77b42177c')
build(){
  cd $_pkgname
  ./gradlew shadowJar
}
package() {
  echo "java -jar /usr/share/$pkgname/picard.jar" >> $pkgname
  chmod +x $pkgname
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 755 $srcdir/$_pkgname/build/libs/picard.jar $pkgdir/usr/share/$pkgname/picard.jar
}
