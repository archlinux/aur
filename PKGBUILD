#
# PKGBUILD for asmotor
#
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#

_pkgname=asmotor
_pkgver=1.2.0
#_commit=fed95a77b995fc594c83d84eee073af1a396cf2b

pkg_ident="${_pkgver//_/-}"
pkg_name_ver="${_pkgname}-${_pkgver//_/-}"

#pkg_ident="${_commit}"
#pkg_name_ver="${_pkgname}-${_commit}"

pkg_name_dir="${pkg_name_ver}-src"

pkgname=${_pkgname}
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Portable, generic assembler engine written in ANSI C99 - supporting 680x0 family, 6502, MIPS32, Z80, Game Boy, DCPU-16, CHIP-8/SCHIP and RC811 CPUs"
arch=('i686' 'x86_64')
url="https://github.com/asmotor/asmotor"
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'gcc')
depends=()
optdepends=()
provides=('asmmotor')
conflicts=('asmmotor')
source=(
        "${_pkgname}-${pkgver}.tar.gz::https://github.com/asmotor/${_pkgname}/releases/download/${pkgver}/${pkg_name_ver}-src.tgz"
        #"${_pkgname}-${pkgver}.tar.gz::https://github.com/asmotor/${_pkgname}/archive/${pkg_ident}.tar.gz"
        #"${_pkgname}-util-master.tar.gz::https://github.com/asmotor/${_pkgname}-util/archive/master.tar.gz"
        )
md5sums=('91011874d9981603b3a039e1207b25dd'
         #'483c64c8733715014138824483515b54'
         #'483c64c8733715014138824483515b54'
         )

#
#
#
BUILD_DIR="_build.out"

#
#
#
prepare()
{
  cd "${srcdir}/${pkg_name_dir}"
  #rmdir "util"
  #ln -s "../${_pkgname}-util-master" "util"
  #patch -p0 < "${startdir}/CMakeLists.txt.patch"
}

#
#
#
build()
{
  cd "${srcdir}/${pkg_name_dir}"
  mkdir -p "${BUILD_DIR}"
  cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles" -DASMOTOR_VERSION=${pkg_ver} -DCMAKE_INSTALL_PREFIX="${pkgdir}" -DCMAKE_BUILD_TYPE=Release
  cmake --build "${BUILD_DIR}"
}

#
#
#
package()
{
  cd "${srcdir}/${pkg_name_dir}"
  mkdir -p "usr"
  cmake --install "${BUILD_DIR}" --prefix "${pkgdir}/usr/"
}

#
# EOF
#
