# Maintainer: Luc Flemming <luc dot flemming at protonmail dot ch>
# Contributor: Alex Wilson <alex@cooperi.net> 

pkgname=libva-vdpau-driver-shadow-nvidia
pkgver=0.7.4c
pkgrel=1
pkgdesc="VDPAU backend for VA API. (Patched special version for shadow-beta)"
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
conflicts=('libva-vdpau-driver'
           'libva-vdpau-driver-shadow'
          )
source=("https://github.com/Ludestru/libva-vdpau-driver/releases/download/v${pkgver}/libva-vdpau-driver-${pkgver}.tar.bz2")
sha256sums=('19415b10d59bb6fbffacb9f1bc76eaf4367e97ad0877b52cdaaefd018b48dddb')

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

