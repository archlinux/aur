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
sha256sums=('SKIP' '40c67bca187b0cc5ac271cbb7cbc82296bd56899ee8c07709523636679129f89')

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
	#Install
	mkdir -p "$pkgdir/usr/share/marblemarcher"
	cp -r game_folder/* "$pkgdir/usr/share/marblemarcher"
	
	mkdir -p "$pkgdir/usr/bin/"
	cp build/MarbleMarcher "$pkgdir/usr/bin/"
	
	install -Dm644 "$srcdir/marblemarcher.desktop" "$pkgdir/usr/share/applications/marblemarcher.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/marblemarcher"
	install -Dm644 README.md "$pkgdir/usr/share/doc/marblemarcher"
}
