# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>
 
pkgname=quaternion
pkgver=0.0.4
pkgrel=1
pkgdesc="Qt5-based IM client for the Matrix protocol"
arch=('any')
url="https://github.com/Fxrh/Quaternion"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols')
makedepends=('git' 'tar' 'cmake')
provides=('quaternion')
conflicts=('quaternion')
source=("https://github.com/QMatrixClient/Quaternion/archive/v$pkgver.tar.gz"
        'https://github.com/QMatrixClient/libqmatrixclient/archive/v0.1.tar.gz')
sha256sums=('8647bd74f24d3225333932a92a461da4fdee10a1a8dd639c38506a20ddb82063'
            '922c6bc420671a16ecadeb7fb5f4fb3a42308d30e8741d2997bfc11e1053edcf')

prepare() {
	mkdir $pkgname
	tar xf v$pkgver.tar.gz -C $pkgname --strip-components=1
	tar xf v0.1.tar.gz -C $pkgname/lib --strip-components=1
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

