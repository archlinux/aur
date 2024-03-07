# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>

_pkg="inherits"
pkgbase="${_pkg}"
pkgname=(
  "nodejs-${pkgbase}"
)
_pkgdesc=(
  'Browser-friendly inheritance fully compatible'
  'with standard node.js'
)
pkgdesc="${_pkgdesc[*]}"
pkgver=2.0.4
pkgrel=1
arch=(
  'any'
)
_gh="https://github.com"
_ns="isaacs"
_http="${_gh}"
url="${_http}/${_ns}/${pkgbase}"
license=(
  'custom'
)
depends=(
  'nodejs'
)
makedepends=(
  'npm'
)
provides=(
  "${pkgbase}=${pkgver}"
)
_npm="http://registry.npmjs.org"
source=(
  "${_npm}/${pkgbase}/-/${pkgbase}-${pkgver}.tgz"
)
noextract=(
  "${pkgbase}-${pkgver}.tgz"
)
sha512sums=(
  '93fbc6697e3f6256b75b3c8c0af4d039761e207bea38ab67a8176ecd31e9ce9419cc0b2428c859d8af849c189233dcc64a820578ca572b16b8758799210a9ec1'
)

build() {
  cd \
    "${srcdir}"
  _sha="$( \
    sha512sum \
      "${pkgbase}-${pkgver}.tgz")"
  printf \
    "%s\n  %s\n  %s\n" \
    "SHA512 checksum of source file:" \
    "${pkgbase}-${pkgver}.tgz:" \
    "${_sha}"
}

package() {
  cd \
    "${pkgdir}"
  local \
    _npm_options=()
  _npm_options=(
    -g
    # --user
    #   root
    --prefix
      "${pkgdir}/usr"
  )
  npm \
    install \
      "${_npm_options[@]}" \
      "${srcdir}/${pkgbase}-${pkgver}.tgz"
  rm \
    -fr \
    "${pkgdir}/usr/etc"
  # Fix npm derp
  find \
    "${pkgdir}/usr" \
    -type \
      d \
    -exec \
      chmod \
        755 \
	'{}' \
	+
}

# vim:set sw=2 sts=-1 et:
