#
# PKGBUILD for cpctools
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#

pkgname=cpctools
pkgver=0.3.3
pkgrel=1
epoch=
pkgdesc="Amstrad CPC tools for cross development"
arch=('i686' 'x86_64')
_pkgname=cpctools
url="https://github.com/cpcsdk/cpctools"
license=('GPL2')
#groups=()
#makedepends=('procps-ng')
depends=('libdsk')
checkdepends=()
#optdepends=()
provides=('cpctools')
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=

source=(https://github.com/cpcsdk/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)

#noextract=()

sha256sums=('0de00c95e671b349a25e4b875f4981ab38c1fd6c7184095872637cd53f82a7a7')

BUILD_DIR="_build.out"

#
#
#

prepare()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
}

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cmake -S cpctools -B "${BUILD_DIR}" -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build "${BUILD_DIR}"
}

check()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  #make -k check
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install "${BUILD_DIR}"
  mkdir -p "${pkgdir}/usr/share/doc/"
  mv "${pkgdir}/usr/docs" "${pkgdir}/usr/share/doc/${pkgname}"
}

#
# EOF
#
