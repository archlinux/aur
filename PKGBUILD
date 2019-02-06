# Maintainer: heliochronix <heliochronix@gmail.com>

pkgname=gr-satellites-git
pkgver=r278.0bf6918
pkgrel=1
pkgdesc="gr-satellites decoder blocks for GNURadio"
arch=('x86_64' 'aarch64')
url="https://github.com/daniestevez/gr-satellites"
license=('GPL3')
depends=('gnuradio' 'boost-libs' 'python2-construct>=2.8')
optdepends=('feh: For realtime image decoders'
            'doxygen: For document generation')
makedepends=('git' 'cmake' 'libfec' 'swig' 'boost')
provides=('gr-satellites')
conflicts=('gr-satellites')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd gr-satellites

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  sed -i 's/env python$/env python2/g' gr-satellites/python/*

  mkdir -p gr-satellites/build
  cd gr-satellites/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd gr-satellites/build

  make DESTDIR="$pkgdir" install
}
