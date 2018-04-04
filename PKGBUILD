# Maintainer: Morgana <morganamilo@gmail.com>

_pkgname=pacmanlogger
pkgname=pacmanlogger-git
pkgver=0.1.2.r0.g1cfa221
pkgrel=1
pkgdesc="A scala application that makes reading pacman's logs easier"
arch=('any')
url="https://github.com/carlocastoldi/PacmanLogger"
license=('MIT')
conflicts=('pacmanlogger')
depends=('java-runtime>=8')
makedepends=('sbt' 'java-environment>=8')
provides=('pacmanlogger')
source=("$_pkgname::git+https://github.com/carlocastoldi/PacmanLogger" "pacmanlogger.sh")
md5sums=('SKIP'
         'abe1b34cb77dfd99a1bf726afb689e96')

build() {
	cd "$_pkgname"
	sbt assembly
}

package() {
	install -Dm755 "pacmanlogger.sh" "$pkgdir/usr/bin/pacmanlogger"

	cd "$_pkgname"
	install -Dm644 "target/scala-2.12/PacmanLogger-assembly-${pkgver%%.r*}.jar" "$pkgdir/usr/share/scala/$_pkgname/$_pkgname.jar"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}
