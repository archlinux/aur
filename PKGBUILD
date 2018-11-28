# Maintainer: Alex Wilson <alex@cooperi.net>

pkgname=libva-vdpau-driver-shadow
pkgver=0.7.4a
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
sha256sums=('3acfe9daad53503adfa320d48aec68044f799020b96bc9548c911ad6445b2f3e')

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

