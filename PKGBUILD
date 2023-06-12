# Maintainer: éclairevoyant
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Jeffrey Clark (h0tw1r3) <dude at zaplabs dot com>

pkgname=attract
pkgver=2.7.0
pkgrel=1
pkgdesc="A joystick/gamepad-controlled graphical front-end for command line emulators"
arch=(i686 x86_64)
url="https://www.attractmode.org/"
license=(GPL3)
depends=(curl ffmpeg libarchive libxinerama openal sfml)
makedepends=(git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mickelson/$pkgname/archive/v$pkgver.tar.gz"
	"https://github.com/mickelson/$pkgname/releases/download/v1.6.2/ATTRACT.MODE.intro.16-9.v6.1080p.mp4"
	"https://github.com/mickelson/$pkgname/releases/download/v1.6.2/ATTRACT.MODE.intro.4-3.v6.1080p.mp4"
	"$pkgname.desktop")
b2sums=('fd05f0256cc91046257c8deb222aeeedf427fb3c1c493d38ee2d6c9667b52d6cab678f6e547eacb08627041b82f8bec3b8814c705fba71c58617a93c2f3587ed'
        'ad46b85040a0e886ea793dafe11a02aad8e0ef36a293b55911d6a4dda2279786ec599b6a8e1656f858a30267e7831a5c4a30e2b95868240d59709863540e67f4'
        '8751ceac1b36858ef7d5d4621f10293f44ac92d576b50570357dcced781323b334ee1fb2c758024a62d8fe74e1bdfad589be2ba2fa9a3780cd010069fd440c50'
        '93dc0dfd133c0d713428b38cb8e2099f90097e39dc2a0c06b185ec1f1066fbf2043bb2731fe5d28a80010cb1f5a81a03dc7625d029bb4717e6b01f6fcce79f8b')

prepare() {
	sed -i '30i#include <string>' $pkgname-$pkgver/src/fe_net.hpp
}

build() {
	VERSION="$pkgver" make -C $pkgname-$pkgver prefix=/usr
}

package() {
	install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 ATTRACT.MODE.intro.16-9.v6.1080p.mp4 "$pkgdir/usr/share/attract/intro/intro.mp4"
	install -Dm644 ATTRACT.MODE.intro.4-3.v6.1080p.mp4 "$pkgdir/usr/share/attract/intro/intro_4x3.mp4"

	cd $pkgname-$pkgver
	make prefix="$pkgdir/usr" install
	install -Dm644 util/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

