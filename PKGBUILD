
pkgname=spotify-qt-git
pkgver=3.9.r294.ge0a2832a
pkgrel=1
pkgdesc="Lightweight Spotify client using Qt"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/kraxarn/spotify-qt"
license=("GPL3")
depends=(qt5-base qt5-svg hicolor-icon-theme)
makedepends=(git cmake gcc make)
optdepends=(
	"librespot: Recommended playback client"
	"spotifyd: Recommended playback client"
)
conflicts=("spotify-qt")
source=("$pkgname::git+$url#branch=master")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make $MAKEFLAGS
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
