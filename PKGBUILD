# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=dynamips
pkgver=0.2.23
pkgrel=1
pkgdesc='Cisco router emulator.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/dynamips'
license=('GPL2')
groups=('gns3')
depends=('libpcap' 'elfutils')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b68af39cd66f10555d860437f55e63887aefdb5a949bacacf3a308cc0c4eaaab3bb9a496c5ac32fd19d3920bada807bff2af8eb66b01d8d735419fec5d134746')

build() {
  if test ${CARCH} == x86_64; then
    export DYNAMIPS_ARCH=amd64
  fi
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake ./ -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
