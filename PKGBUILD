# Maintainer: Morganamilo <morganamilo@gmail.com>

_pkgname=PacmanLogger
pkgname=pacmanlogger
pkgver=0.1.5
pkgrel=3
pkgdesc="A scala application that makes reading pacman's logs easier"
arch=('any')
url="https://github.com/carlocastoldi/PacmanLogger"
license=('MIT')
depends=('java-runtime')
makedepends=('sbt' 'java-environment')
provides=('pacmanlogger')
conflicts=('pacmanlogger')
source=("$pkgname-$pkgver::https://github.com/carlocastoldi/PacmanLogger/archive/$pkgver.tar.gz" "pacmanlogger.sh")
sha256sums=('c120d2b65bbd5874e302ff8147ec553864608a6be1d50838c28c0cad15ac690d'
            'f47f774a67f2f966d9bb5afa406ac3a98698d9728868e1375f62782a9a4fe4f6')

build() {
	cd "$_pkgname-$pkgver"
	sbt assembly
}

package() {
	install -Dm755 "pacmanlogger.sh" "$pkgdir/usr/bin/pacmanlogger"

	cd "$_pkgname-$pkgver"
	install -Dm644 "target/scala-2.12/PacmanLogger-assembly-$pkgver.jar" "$pkgdir/usr/share/scala/$pkgname/$pkgname.jar"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
