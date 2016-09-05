# Maintainer: Martin Weinelt <hexa@darmstadt.ccc.de>
 
pkgname=quaternion-git
pkgver=afdab5b
pkgrel=2
pkgdesc="Qt5-based IM client for the Matrix protocol"
arch=('any')
url="https://github.com/Fxrh/Quaternion"
license=('LGPL')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols')
makedepends=('git')
provides=('quaternion')
conflicts=('quaternion')
source=('quaternion-git::git+https://github.com/fxrh/quaternion.git')
md5sums=('SKIP')
 
pkgver () {
	cd $pkgname
	echo $(git describe --always | sed 's/-/./g')
}

prepare() {
	cd $pkgname
	git remote set-url origin https://github.com/fxrh/quaternion.git
	git submodule update --init --recursive
}
 
build() {
	mkdir $pkgname/build || true
	cd $pkgname/build
	cmake ..
	make $MAKEFLAGS
}
 
package() {
	cd $pkgname

	# The application
	install -Dm755 "build/quaternion" -t "$pkgdir/usr/bin/"

	# .desktop file
	install -Dm644 "linux/quaternion.desktop" -t "$pkgdir/usr/share/applications/"
}

