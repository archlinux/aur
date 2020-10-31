# Maintainer: kraxarn <me@kraxarn.com>

pkgname=spotify-qt
pkgver=3.0
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
sha256sums=("27856f0a0b928695639f771e36305927f8279d93f71a3884873759cefabda80c")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGIT_TAG=v$pkgver .
	make $MAKEFLAGS
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}