# Maintainer: kraxarn <me@kraxarn.com>

pkgname=spotify-qt
pkgver=0.14
pkgrel=1
pkgdesc="Work-in-progress Spotify client using Qt"
arch=(x86_64)
url="https://github.com/kraxarn/spotify-qt"
license=("GPL3")
depends=(qt5-base qt5-svg hicolor-icon-theme)
makedepends=(git cmake gcc make)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=("6afb94ee3b1e16defe3f58c2eb47bdea6230a0dc5bdc73a7fb5cbb5e18323e90")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGIT_TAG=v$pkgver .
	make $MAKEFLAGS
}

package() {
	
	cd "$pkgname-$pkgver"
	# Install app
	make DESTDIR="$pkgdir" install
	# Install icons
	sizes=(16 24 32 48 64 96 128 256 512)
	for size in ${sizes[*]}
	do
		install -Dm644 "res/app/${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify-qt.png"
	done
	# Install desktop shortcut
	install -Dm644 "res/app/spotify-qt.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}