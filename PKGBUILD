# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>
pkgname=scalarr
pkgver=1.0.1
pkgrel=1
pkgdesc="A command-line interface for Sonarr"
arch=('any')
url="https://github.com/nichobi/scalarr"
license=('GPL')
depends=('java-runtime')
makedepends=('sbt')
source=("scalarr-v$pkgver.tar.gz::https://github.com/nichobi/$pkgname/archive/v$pkgver.tar.gz" scalarr.sh)
sha256sums=('ed0fd975400e22a211695d2b44d778665a015206fdebe7575da3e8fd094686e8' '603e8c012cb0c72a9b4615457fdeb67e92c4311b436f4ee535448d402a98b54d')

build() {
	cd "$pkgname-$pkgver"
	sbt assembly
}
package() {
	cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/java/scalarr/
  cp target/scala-2.13/$pkgname-assembly-$pkgver.jar $pkgdir/usr/share/java/scalarr/scalarr.jar
  mkdir -p $pkgdir/usr/bin/
  cp ../scalarr.sh $pkgdir/usr/bin/scalarr
  chmod +x $pkgdir/usr/bin/scalarr
}
