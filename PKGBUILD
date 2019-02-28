# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=dynamips
pkgver=0.2.20
pkgrel=1
pkgdesc='Cisco router emulator.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/dynamips'
license=('GPL2')
groups=('gns3')
depends=('libpcap' 'elfutils')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c6535177c175422b741a4660697f7d9a29f19b6e42dd049e027fd7e3e152520e')

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
