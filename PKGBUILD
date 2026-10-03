# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=dynamips
pkgver=0.2.25
pkgrel=1
pkgdesc='Cisco router emulator.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/dynamips'
license=('GPL2')
groups=('gns3')
depends=('libpcap' 'elfutils')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('17ba4bceb1afde7881ff55fa1efcb3cae4288906e862d174130c0b7660d619461b72d9bb1db1e7cd63b3a2f210bda9da8e53b9e74d77c3faa19be70a1b125e60')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/cmake_minimum_required ( VERSION 2.8 )/cmake_minimum_required ( VERSION 3.5 )/' CMakeLists.txt
  sed -i 's/cmake_policy ( VERSION 2.8 )/cmake_policy ( VERSION 3.5 )/' CMakeLists.txt
}

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
