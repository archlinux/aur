#
# PKGBUILD for IceBroLite
#
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#

_pkgname=IceBroLite
_pkgver=main
#_commit=fed95a77b995fc594c83d84eee073af1a396cf2b

pkg_ident="${_pkgver//_/-}"
pkg_name_ver="${_pkgname}-${_pkgver//_/-}"

#pkg_ident="${_commit}"
#pkg_name_ver="${_pkgname}-${_commit}"

pkg_name_dir="${pkg_name_ver}"

pkgname=icebrolite-git
pkgver=fef87496
pkgrel=1
pkgdesc="External Debugger for VICE Commodore (C64) emulator"
arch=('i686' 'x86_64')
url="https://github.com/Sakrac/IceBroLite"
license=('GPL')
makedepends=('make' 'gcc' 'pkgconf')
depends=('glfw')
optdepends=()
provides=()
conflicts=(${pkgname})
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/Sakrac/${_pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('SKIP')


#
#
#
pkgver()
{
  cd "${srcdir}/${pkg_name_dir}"
  git ls-remote -h "${url}" refs/heads/main | tr -s '[:blank:]' ' ' | cut -c1-8
  #(
  #  set -o pipefail
  #  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
}

#
#
#
prepare()
{
  cd "${srcdir}/${pkg_name_dir}"
  #patch -p0 < "${startdir}/patch-Makefile.diff"
}

#
#
#
build()
{
  cd "${srcdir}/${pkg_name_dir}"
  make -C src
}

#
#
#
package()
{
  cd "${srcdir}/${pkg_name_dir}"
  install -m 755 -D "IceBroLite.exe" "${pkgdir}/usr/bin/icebrolite"
}

#
# EOF
#
