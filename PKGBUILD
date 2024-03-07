# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>

_pkgbase=hardhat
pkgname="${_pkgbase}"
pkgdesc='Ethereum development environment for professionals'
pkgver=2.21.0
pkgrel=1
arch=(
  'any'
)
_ns="NomicFoundation"
url="https://github.com/${_ns}/${_pkgbase}"
license=(
  'custom'
)
depends=(
  'nodejs'
)
makedepends=(
  'npm'
)
source=(
  http://registry.npmjs.org/$_pkgbase/-/$_pkgbase-$pkgver.tgz
)
noextract=(
  "${_pkgbase}-${pkgver}.tgz"
)
sha512sums=(
  'f039490152431151da575b21f452ee28b2e0085bfd10027e33ef086e34883e0a1e368decb392f51e018131f9c8f3c73b3b330466475cbb21a8a1b15e2b73abab'
)

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
      "${srcdir}/${_pkgbase}-${pkgver}.tgz"
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
