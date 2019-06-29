# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>

pkgname=mjpg-streamer-git
epoch=1
pkgver=r346.501f636
pkgrel=1
pkgdesc="Stream mjpeg frames from a webcam via http"
arch=(i686 x86_64 arm)
url="https://github.com/jacksonliam/mjpg-streamer"
license=(GPL2)
depends=(libjpeg-turbo imagemagick)
provides=(mjpg-streamer)
conflicts=(mjpg-streamer)
makedepends=(git cmake)
source=("git+https://github.com/jacksonliam/mjpg-streamer.git")
sha256sums=(SKIP)

pkgver() {
  cd "${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname/-git/}/mjpg-streamer-experimental"
  make
}

package() {
  cd "${pkgname/-git/}/mjpg-streamer-experimental"
  make DESTDIR="${pkgdir}" install
}
