# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
pkgname=libva-vdpau-driver
pkgver=0.7.4
pkgrel=3
pkgdesc='VDPAU backend for VA API'
arch=('x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('GPL')
depends=('glibc' 'libgl' 'libva' 'libvdpau' 'libx11')
makedepends=('mesa')
source=("http://freedesktop.org/software/vaapi/releases/libva-vdpau-driver/libva-vdpau-driver-${pkgver}.tar.bz2"
        'libva-vdpau-driver-0.7.4-glext-missing-definition.patch'
        'libva-vdpau-driver-0.7.4-libvdpau-0.8.patch'
        'libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch')
sha256sums=('155c1982f0ac3f5435ba20b221bcaa11be212c37db548cd1f2a030ffa17e9bb9'
            '776bfe4c101cdde396d8783029b288c6cd825d0cdbc782ca3d94a5f9ffb4558c'
            '5e567b026b97dc0e207b6c05410cc1b7b77a58ceb5046801d0ea1a321cba3b9d'
            '1ae32b8e5cca1717be4a63f09e8c6bd84a3e9b712b933816cdb32bb315dbda98')

prepare() {
  cd libva-vdpau-driver-${pkgver}

  patch -p1 -i ../libva-vdpau-driver-0.7.4-glext-missing-definition.patch
  patch -p1 -i ../libva-vdpau-driver-0.7.4-libvdpau-0.8.patch
  patch -p1 -i ../libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch
}

build() {
  cd libva-vdpau-driver-${pkgver}

  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd libva-vdpau-driver-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
