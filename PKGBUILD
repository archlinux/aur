# Maintainer: Liam Greenough <beacon515@gmail.com>
pkgname=obs-websocket-git
pkgver=r569.357691b
pkgrel=1
pkgdesc="Remote control of OBS Studio made easy"
arch=('i686' 'x86_64')
url="https://github.com/Palakis/obs-websocket"
license=('GPL2')
depends=('obs-studio-git' 'qt5-websockets')
makedepends=('git' 'cmake')
provides=('obs-websocket')
conflicts=('obs-websocket')
source=('git+https://github.com/jp9000/obs-studio.git' 'git+https://github.com/Palakis/obs-websocket.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/obs-websocket"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/obs-websocket"
	mkdir build || true
	cd build
	cmake -DLIBOBS_INCLUDE_DIR="$srcdir/obs-studio/libobs/" -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/obs-websocket/build"
	make DESTDIR="$pkgdir/" install
}
