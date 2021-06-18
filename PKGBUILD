# Maintainer: Morganamilo <morganamilo@gmail.com>

_pkgname=pacmanlogger
pkgname=pacmanlogger-git
pkgver=0.1.5.r0.g5106c75
pkgrel=1
pkgdesc="A scala application that makes reading pacman's logs easier"
arch=('any')
url="https://github.com/carlocastoldi/PacmanLogger"
license=('MIT')
depends=('java-runtime')
makedepends=('git' 'sbt' 'java-environment')
provides=('pacmanlogger')
conflicts=('pacmanlogger')
source=("$_pkgname::git+https://github.com/carlocastoldi/PacmanLogger" "pacmanlogger.sh")
sha256sums=('SKIP'
            'cb28e3ca670cdfd5966b21f33c57518c8c5e9751bcbe8c0051f5d720c26ae984')

build() {
	cd "$_pkgname"
	sbt assembly
}

package() {
	install -Dm755 "pacmanlogger.sh" "$pkgdir/usr/bin/pacmanlogger"

	cd "$_pkgname"
	install -Dm644 "target/scala-2.12/PacmanLogger-assembly-${pkgver%%.r*}.jar" "$pkgdir/usr/share/scala/$_pkgname/$_pkgname.jar"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}
