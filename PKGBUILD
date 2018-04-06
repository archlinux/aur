# Maintainer: Morgana <morganamilo@gmail.com>

_pkgname=PacmanLogger
pkgname=pacmanlogger
pkgver=0.1.3
pkgrel=1
pkgdesc="A scala application that makes reading pacman's logs easier"
arch=('any')
url="https://github.com/carlocastoldi/PacmanLogger"
license=('MIT')
conflicts=('pacmanlogger')
depends=('java-runtime>=8')
makedepends=('sbt' 'java-environment>=8')
provides=('pacmanlogger')
source=("$pkgname-$pkgver::https://github.com/carlocastoldi/PacmanLogger/archive/$pkgver.tar.gz" "pacmanlogger.sh")
md5sums=('65847b77a2ba34b6a25a3589ee53190a'
         'abe1b34cb77dfd99a1bf726afb689e96')

build() {
	cd "$_pkgname-$pkgver"
	sbt assembly
}

package() {
	install -Dm755 "pacmanlogger.sh" "$pkgdir/usr/bin/pacmanlogger"

	cd "$_pkgname-$pkgver"
	install -Dm644 "target/scala-2.12/PacmanLogger-assembly-$pkgver.jar" "$pkgdir/usr/share/scala/$pkgname/$pkgname.jar"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
