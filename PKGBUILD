# Maintainer: kraxarn <me@kraxarn.com>

pkgname=spotify-qt
pkgver=3.1
pkgrel=1
pkgdesc="Lightweight Spotify client using Qt"
arch=(x86_64)
url="https://github.com/kraxarn/spotify-qt"
license=("GPL3")
depends=(qt5-base qt5-svg hicolor-icon-theme)
makedepends=(git cmake gcc make)
optdepends=(
	"librespot: Recommended playback client"
	"spotifyd: Recommended playback client"
)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=("398da7d9f07fadf7630e63926d762f75e178f9d3c8522e72215e8774e0430418")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGIT_TAG=v$pkgver .
	make $MAKEFLAGS
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}