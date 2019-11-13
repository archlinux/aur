# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>

pkgname=mjpg-streamer-git
epoch=1
pkgver=r346.501f636
pkgrel=2
pkgdesc="Stream mjpeg frames from a webcam via http"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/jacksonliam/mjpg-streamer"
license=(GPL2)
depends=(libjpeg-turbo imagemagick)
provides=(mjpg-streamer)
conflicts=(mjpg-streamer)
makedepends=(git cmake protobuf-c zeromq sdl libgphoto2 v4l-utils python-numpy)
source=("git+https://github.com/jacksonliam/mjpg-streamer.git")
sha256sums=(SKIP)

pkgver() {
  cd "${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname/-git/}/mjpg-streamer-experimental"
  install -d _build
}

build() {
  cd "${pkgname/-git/}/mjpg-streamer-experimental/_build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_INPUT_OPENCV=OFF \
    -DENABLE_HTTP_MANAGEMENT=ON \
    -DWXP_COMPAT=ON \
    -DCMAKE_BUILD_TYPE=release
}

package() {
  cd "${pkgname/-git/}/mjpg-streamer-experimental"
  make DESTDIR="${pkgdir}" install
}
