# Maintainer: Guoyi Zhang <guoyi zhang at malacology dot net>
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
_pkgname=picard
pkgver=3.4.0
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(any)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=17')
makedepends=('ant' 'git' 'java-environment=17')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('7afce95fad7bc87b272c6f1ec764ea8fe99af7a0fab65b0417dba81dd759c851')
build(){
  cd $_pkgname
  ./gradlew shadowJar
}
package() {
  echo "java -jar /usr/share/$_pkgname/picard.jar \$@" >> $_pkgname-java
  chmod +x $_pkgname-java
  install -Dm 755 $_pkgname-java $pkgdir/usr/bin/$_pkgname-java
  install -Dm 755 $srcdir/$_pkgname/build/libs/picard.jar $pkgdir/usr/share/$_pkgname/picard.jar
}
