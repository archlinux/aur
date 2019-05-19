# Maintainer: Nick Gaulke <incomingstick@gmail.com>
pkgname=('openrpg-git')
pkgver=0.4.4_dev # update this when new releases happen
_orpgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Open C++ library and utilities for common RPG rulesets"
arch=('x86_64')
url="https://openrpg.io"
license=('custom:OSL' 'custom:OGL')
depends=()
makedepends=('gcc>=4.7' 'cmake>=2.8.4')
changelog=
source=(https://github.com/incomingstick/OpenRPG/archive/v${_orpgver}.tar.gz)
noextract=()
md5sums=('7c732b689aee64744e7696b30afa9de7')

build() {
  mkdir -p "${srcdir}/build"

  cd "${srcdir}/build"

  cmake "${srcdir}/OpenRPG-${_orpgver}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=RELEASE

  make && make check
}

package_openrpg-git() {
  pkgdesc='Free peer-reviewed portable C++ source libraries - development headers and binaries'

  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  install -Dm644 ${srcdir}/OpenRPG-${_orpgver}/LICENSE "${pkgdir}/usr/share/licenses/openrpg/LICENSE"
}

# package_openrpg-libs() {
#   pkgdesc='Free peer-reviewed portable C++ source libraries - runtime libraries'
  
#   cd "${srcdir}/build"

#   make DESTDIR="${pkgdir}" install
  
#   install -Dm644 ${srcdir}/${pkgbase}-${_orpgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
# }