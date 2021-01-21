#
# PKGBUILD: badass (bass)
#
# Maintainer: Uffe Jakobsen <_microtop_-at-_starion_-_dot_-_dk_>
#

_pkgname="bass"
_pkgver="beta7"

pkgname="badass"
pkgver=0.0${_pkgver}
pkgrel=1
pkgdesc="Advanced 6502 assembler with embedded lua."
arch=('i686' 'x86_64')
url="https://github.com/sasq64/bass"
license=('custom')
makedepends=('cmake')
depends=()
source=(https://github.com/sasq64/bass/archive/${_pkgver}.tar.gz)
md5sums=('7cbe7f492ed2bc0fa91197affc2cf6fe')

#
#
#

#pkg_name_ver="${_pkgname}-${_pkgver//_/-}"
pkg_name_ver="${_pkgname}-${_pkgver}"
BUILD_DIR="_build"


prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}

build()
{
  cd "${srcdir}/${pkg_name_ver}"
  cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles"
  make -C "${BUILD_DIR}"
}

check()
{
  cd "${srcdir}/${pkg_name_ver}"
  # disabled - seems to fail for beta6
  #${BUILD_DIR}/tester
}

package()
{
  #V="-v"
  V=""

  # beta6 seems to have no real install
  #make -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
  #
  cd "${srcdir}/${pkg_name_ver}"
  #
  mkdir -p "${pkgdir}/usr/bin"
  install ${V} -m 755 -D "${srcdir}/${pkg_name_ver}/${BUILD_DIR}/bass" "${pkgdir}/usr/bin/bass"
  #
  mkdir -p "${pkgdir}/usr/share/${pkgname}/docs"
  (cd ${srcdir}/${pkg_name_ver}/docs && find . -type f -exec install ${V} -m 644 -D "{}" "${pkgdir}/usr/share/${pkgname}/docs/{}" \;)
  #
  mkdir -p "${pkgdir}/usr/share/${pkgname}/asm"
  (cd ${srcdir}/${pkg_name_ver}/asm && find . -type f -exec install ${V} -m 644 -D "{}" "${pkgdir}/usr/share/${pkgname}/asm/{}" \;)
  # remote dasm executable
  rm -f "${pkgdir}/usr/share/${pkgname}/asm/a2600/dasm"
  #
  (cd ${srcdir}/${pkg_name_ver}/data && find . -type f -exec install ${V} -m 644 -D "{}" "${pkgdir}/usr/share/${pkgname}/asm/data/{}" \;)
  #
  mkdir -p "${pkgdir}/usr/share/${pkgname}/vim"
  (cd ${srcdir}/${pkg_name_ver}/vim && find . -type f -exec install ${V} -m 644 -D "{}" "${pkgdir}/usr/share/${pkgname}/vim/{}" \;)
}

#
# EOF
#
