# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkg="alacritty"
_pkgname="${_pkg}-theme"
pkgname="${_pkgname}-git"
_aurver=0.0.1
pkgver=0.0.1+914f463
pkgrel=1
pkgdesc="Collection of Alacritty color schemes."
arch=('any')
url="https://github.com/${_pkg}/${_pkgname}"
license=('apache')
depends=("${_pkg}")
makedepends=()
source=(
  "${_pkgname}::git+${url}"
)
b2sums=('SKIP')

pkgver() {
  local _pkgver
  local _msg="fatal: No names found, cannot describe anything."
  cd "${_pkgname}"
  _pkgver="$(git describe --tags | sed 's/-/+/g')"
  if [ "${_pkgver}" = "" ]; then
    _pkgver="$(git describe --tags --always)"
    echo "${_aurver}+${_pkgver}"
  else
    echo "${_pkgver}"
  fi
}

package() {
  provides=(
    "${_pkgname}=${pkgver}"
  )
  conflicts=(
    "${_pkgname}"
  )
  _srcdir="${srcdir}/${_pkgname}/themes"
  _output="${pkgdir}/usr/share/alacritty"
  install -dm755 "${_srcdir}" "${_output}"
  cp -r "${_srcdir}" "${_output}"
}
