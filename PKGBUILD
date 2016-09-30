# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=snap-photobooth
pkgver=0.3.0.1
pkgrel=1
pkgdesc='The Pantheon Photo Booth'
arch=('i686' 'x86_64')
url='https://launchpad.net/snap-elementary'
license=('GPL3')
groups=('pantheon')
depends=('clutter' 'clutter-gst' 'clutter-gtk' 'glib2' 'glibc' 'gstreamer'
         'gtk3'
         'libgranite.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/snap-elementary/0.3.x/${pkgver}/+download/snap-photobooth-${pkgver}.tar.xz")
sha256sums=('7c604ba3735cdbd6c7c878908d8c77ee45867068e29b61258f4e9d12bbb1735f')

prepare() {
  cd snap-photobooth-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd snap-photobooth-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd snap-photobooth-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
