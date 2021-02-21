# Maintainer: Jakob (XDjackieXD) <aur at chaosfield dot at>

pkgname=gr-satnogs-git
pkgver=r584.1103a05
pkgrel=1
pkgdesc="gr-satnogs from librespacefoundation"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/librespacefoundation/satnogs/gr-satnogs.git"
license=('GPL3')
depends=('gnuradio' 'gr-soapy' 'png++' 'nlohmann-json' 'libvorbis' 'libogg' 'libvolk' 'libpng')
makedepends=('git' 'cmake' 'swig')
provides=('gr-satnogs')
conflicts=('gr-satnogs')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd gr-satnogs

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p gr-satnogs/build
  cd gr-satnogs/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd gr-satnogs/build

  make DESTDIR="$pkgdir" install
}

