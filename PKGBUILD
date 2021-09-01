# Maintainer: dreieck

_pkgname=vvo-departures-cli
pkgname="${_pkgname}"
pkgver=20210901+01
pkgrel=1
pkgdesc="A command line interface to query real time departure data from stops within the Verkehrsverbund Oberelbe (VVO)."
arch=(
  "any"
)
# Based on the information provided at https://github.com/kiliankoe/vvo/blob/main/documentation/widgets.md.
# url=""
license=(
  'GPL3'
)
depends=(
  "bash"
  "util-linux" # for 'column'
  "curl"
  "jq"
)
makedepends=()
optdepends=()
provides=()
conflicts=()
source=(
  "vvo-departures"
)
sha256sums=(
  '17eb29ccfe5dacb7977f3af41bb736ddcb4ecda453385ba1ef5ef132d72e8616'
)

pkgver() {
  _ver="$(grep -E '^[[:space:]]*#+[[:space:]]*VERSION:' "${srcdir}/${source[0]}" | head -n1 | awk -F: '{print $2}' | tr '-' '_' | tr -d "\"'[[:space:]]")"
  if [ -z ${_ver} ]; then
    error "Could not determine version. Aborting."
    return 1
  fi
  printf '%s' "${_ver}"
}

package() {
  install -v -D -m755 "${srcdir}/${source[0]}" "${pkgdir}/usr/bin/vvo-departures"
}
