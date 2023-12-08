# SPDX-License-Identifier: AGPL-3.0
# Maintainer: Pellegrino Prevete <pellegrinoprevete at gmail.com>
# Contributor: mehalter <micah at mehalter.com>
# Contributor: xsmile <>
# Contributor: Pieter Frenssen <pieter@frenssen.be>

pkgname="myetherwallet"
_pkg="MyEtherWallet"
pkgver=6.7.3
pkgrel=2
_pkgdesc=(
  'Client-side interface for interacting'
  'with the Ethereum blockchain')
pkgdesc="${_pkgdesc[*]}"
arch=(any)
depends=(
  xdg-utils)
url="https://github.com/${_pkg}/${_pkg}"
license=(MIT)
source=(
  "${url}/releases/download/v${pkgver}/${_pkg}-v${pkgver}.zip"{,.sig}
  "${pkgname}.desktop"
  "${pkgname}"
  "${pkgname}.license")
sha256sums=(
  '4627d06dce696f5325eefe460959eae381ec8be31b7b2ae38d3c3cb1f3f97f31'
  'SKIP'
  'b49e3bb0cded23c40820281a110d2baed5d1f7aa036635108323d0133e0e30e9'
  '814f489e4e6e0ce172513febf58d6821e7b77cd2e644152aec4888228fe41da5'
  '42039cf560b0b2b35463f33656d9639c8f9b98e9a4f57723dbab0a90a4ad8ad6')
validpgpkeys=(
  '2FCA4A1E3AF4278F7AD3B7637F059C0F7B9A12F0')

prepare() {
  # Remove JS source maps
  find . -name "*.map" -delete
  # Remove development versions of JS files
  find . -name "*.dev.js" -delete
}

package() {
  # Lib directory
  install \
    -d "${pkgdir}/opt/${pkgname}"
  cp \
    -a \
    css \
    fonts \
    img \
    js \
    workbox-* \
    *.css \
    *.html \
    *.js \
    *.png \
    "${pkgdir}/opt/${pkgname}"
  # Executable
  install \
    -Dm755 "${srcdir}/${pkgname}" \
    -t "$pkgdir"/usr/bin
  # License
  install \
    -Dm644 "${srcdir}/${pkgname}.license" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # Menu entry and icon
  install \
    -Dm644 "${srcdir}/${pkgname}.desktop" \
    -t "$pkgdir"/usr/share/applications
  install \
    -Dm644 favicon.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set sw=2 sts=-1 et:
