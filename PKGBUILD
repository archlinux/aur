# Maintainer: Zyansheep <zyansheep at gmail dot com>

pkgname=marblemarcher-git
pkgdesc="Community Version of the game Marble Marcher, where you explore 3D raymarched fractals by controlling a marble"
pkgver=v1.4.2.r54.gec85f58
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/WAUthethird/Marble-Marcher-Community-Edition"
license=('GPL2')
depends=(eigen sfml anttweakbar glm)
makedepends=(make cmake git)
provides=("marblemarcher")
conficts=("marblemarcher")

source=(
	'marblemarcher::git+https://github.com/WAUthethird/Marble-Marcher-Community-Edition#branch=master'
	'marblemarcher.desktop')
sha256sums=('SKIP' '902387d9365654b4a8225c5e99b972f696a981f396adc576feb2d830e39f8890')

pkgver() {
	cd "marblemarcher"
	# Use most recent annotated tag reachable from the latest commit
	git describe --long --tags| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build(){
	cd "marblemarcher"
	mkdir -p build
	cd build
	cmake ..
	make
}
package(){
	cd "marblemarcher"
	mkdir -p "$pkgdir/opt/marblemarcher"
	cp -r game_folder/* "$pkgdir/opt/marblemarcher"
	cp build/MarbleMarcher "$pkgdir/opt/marblemarcher"
	install -D "$srcdir/marblemarcher.desktop" "$pkgdir/usr/share/applications/marblemarcher.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/marblemarcher"
	install -Dm644 README.md "$pkgdir/usr/share/doc/marblemarcher"
}
