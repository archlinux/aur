# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=dynamips
pkgver=0.2.17
pkgrel=1
pkgdesc='Cisco router emulator.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/dynamips'
license=('GPL2')
groups=('gns3')
depends=('libpcap' 'elfutils')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d524ef32b78dd7384775920604912d3b4b212ded338cc4df930b0086df1e81ed')

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

# vim:set ts=2 sw=2 et:
