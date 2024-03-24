# Maintainer: Mihai Coman <mihai@m1x.ro>
# Contributor: Maxime Gauduin <alucryd@archlonux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libva1-compat
pkgver=1.8.3
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux'
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
depends=('libdrm' 'libgl' 'libxfixes')
makedepends=('mesa')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards')
source=("https://github.com/intel/libva/releases/download/${pkgver}/libva-${pkgver}.tar.bz2")
sha256sums=('56ee129deba99b06eb4a8d4f746b117c5d1dc2ec5b7a0bfc06971fca1598ab9b')

build() {
  cd libva-${pkgver}

  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd libva-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/libva
  rm -rf "${pkgdir}"/usr/{include,lib/{lib*.so,pkgconfig},share}
}

# vim: ts=2 sw=2 et:
