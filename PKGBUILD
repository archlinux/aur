# Maintainer: dreieck

_uses=db-wifi-login
_pkgbase="${_uses}-woice-compat"
_pkgname="${_pkgbase}"
pkgbase="${_pkgbase}"
pkgname="${_pkgname}"
epoch=0
pkgver=0.1_20220904.1
pkgrel=1
pkgdesc="Makes '${_uses}' a drop-in replacement for '/usr/bin/woice' by providing an appropriate symlink."
url="https://aur.archlinux.org/pkgbase/${_uses}"
arch=(any)
license=(GPL3)
depends=(
  "${_uses}"
)
makedepends=()
optdepends=()
provides=("woice")
conflicts=("woice")
source=()
sha256sums=()

pkgver() {
  cd "${srcdir}"

  _ver="$(pacman -Q "${_uses}" | cut -d ' ' -f 2 | sed -E 's|-.*||')"
  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}"
  fi
}

package() {
  install -d -v -m755 "${pkgdir}/usr/bin"
  ln -svr "${pkgdir}/usr/bin/db-wifi-login" "${pkgdir}/usr/bin/woice"
}
