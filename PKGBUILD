# Maintainer: Martin Weinelt <hexa@darmstadt.ccc.de>
 
pkgname=quaternion
pkgver=0.0.1
pkgrel=2
pkgdesc="Qt5-based IM client for the Matrix protocol"
arch=('any')
url="https://github.com/Fxrh/Quaternion"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols')
makedepends=('git' 'tar' 'cmake')
provides=('quaternion')
conflicts=('quaternion')
source=('https://github.com/Fxrh/Quaternion/releases/download/v0.0.1/quaternion-source-0.0.1.tar.gz')
sha256sums=('2fa6708e72a78a1dd1001b059fd077ef4665a4aab53288c688869246cd2db8c5')

prepare() {
	mkdir $pkgname
	tar xf quaternion-source-0.0.1.tar.gz -C $pkgname --strip-components=1
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

	# Icons
	install -Dm644 "icons/quaternion/16-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/16x16/apps/"
	install -Dm644 "icons/quaternion/22-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/22x22/apps/"
	install -Dm644 "icons/quaternion/32-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	install -Dm644 "icons/quaternion/48-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	install -Dm644 "icons/quaternion/64-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
	install -Dm644 "icons/quaternion/128-apps-quaternion.png" -t "$pkgdir/usr/share/icons/hicolor/128x1128/apps/"
	install -Dm644 "icons/quaternion/sources/quaternion.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}

