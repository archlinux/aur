# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=daggy
pkgver=2.0.2
pkgrel=1
pkgdesc='Run multiple commands on remote servers simultaneously and save output locally'
arch=('x86_64')
depends=('qt5-base' 'yaml-cpp' 'libssh2')
makedepends=('cmake')
license=('MIT')
url='https://docs.daggy.dev/'
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/synacker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('52533067684db505b567a794bbefc688684ce64db8a7e4726976125cd26534b4')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's|kainjow/mustache.hpp|mustache.hpp|' "src/Daggy/Precompiled.h"
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DVERSION=${pkgver} -DCMAKE_INSTALL_PREFIX=/usr src
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
