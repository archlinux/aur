# Maintainer: dreieck

_pkgname="temp-throttle-openrc"
pkgname="${_pkgname}"
epoch=0
pkgver=0.1.d20260302
pkgrel=1
pkgdesc="OpenRC init script for 'temp-throttle'."
arch=(
  'any'
)
url="https://aur.archlinux.org/pkgbase/temp-throttle-openrc"
license=('GPL-3.0-or-later')
depends=(
  'temp-throttle'
)
optdepends=(
  'openrc: To make use of the OpenRC initscripts.'
)
makedepends=()
backup=(
  'etc/conf.d/temp-throttle'
)
source=(
  'temp-throttle-openrc'
  'temp-throttle-conf.d'
)
sha256sums=(
  'e5c77af0eafce01f96914a425ba6a754d38ce813a3ee8cc8ef9e5daff357320c'  # temp-throttle-openrc
  '80601aef49cdd5d93075daf3a916e5e1f4e308f5234d93914bca3f17b27fbaeb'  # temp-throttle-conf.d
)

pkgver() {
  local _ver
  _ver="$(grep -E '^[[:space:]]*#[[:space:]]*INITSCRIPTVERSION[[:space:]]*=' temp-throttle-openrc | awk -F '=' '{print $2}' | awk -F# '{print $1}' | tr -d \"\'[[:space:]])"
  _date="$(grep -E '^[[:space:]]*#[[:space:]]*INITSCRIPTDATE[[:space:]]*=' temp-throttle-openrc | awk -F '=' '{print $2}' | awk -F# '{print $1}' | tr -d \"\'[[:space:]])"
  if [ -z "${_ver}" ]; then
    error "Could not determine version."
  fi
  if [ -z "${_date}" ]; then
    error "Could not determine script's edit date."
  fi
  printf '%s' "${_ver}.d${_date}"
}

package() {
  install -D -v -m755 "${srcdir}/temp-throttle-openrc" "${pkgdir}/etc/init.d/temp-throttle"
  install -D -v -m644 "${srcdir}/temp-throttle-conf.d" "${pkgdir}/etc/conf.d/temp-throttle"
}
