# Maintainer: Alex Wilson <alex@cooperi.net>

pkgname=libva-vdpau-driver-shadow
pkgver=0.7.4b
pkgrel=1
pkgdesc="VDPAU backend for VA API. (special version for shadow-beta)"
arch=('x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('GPL')
depends=('libva'
         'libvdpau'
         'libgl'
         )
makedepends=('mesa')
replaces=('vdpau-video')
provides=('libva-vdpau-driver')
conflicts=('libva-vdpau-driver')
source=("https://github.com/arekinath/libva-vdpau-driver/releases/download/v${pkgver}/libva-vdpau-driver-${pkgver}.tar.bz2")
sha256sums=('290950b118689b6797f5ede418569f96317b88d6b9d077755b92c237c9182451')

prepare() {
  mkdir -p build

  cd build
  ../"libva-vdpau-driver-${pkgver}"/configure \
    --prefix=/usr
}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

