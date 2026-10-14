#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291

# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname='puppyclicker'
pkgname="${_pkgname}-appimage"
pkgver=3.5.1
pkgrel=1
pkgdesc='Click your puppies from anywhere. (By KinkyRaven)'
url="https://${_pkgname}.app/"
arch=(
  'x86_64'
  'aarch64'
)
license=('unknown')
_cdn_url="https://cdn${_pkgname}.boundfire.com/build"
depends=(
  'grep'
)
source_x86_64=("${_pkgname}.AppImage::${_cdn_url}/linux.AppImage")
source_aarch64=("${_pkgname}.AppImage::${_cdn_url}/linux-arm64.AppImage")

pkgver() {
  mkdir          'extracted'
  cp      -t     'extracted/'                                  "${_pkgname}.AppImage"
  grep    -oP    'X-AppImage-Version=\K.*'                     "extracted/squashfs-root/${_pkgname}.desktop"
}

package() {
  cd             "${srcdir}"

  mkdir   -p     "${pkgdir}/usr/bin"
  mkdir   -p     "${pkgdir}/usr/share/applications"

  install -Dm755 "${_pkgname}.AppImage"                        "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "extracted/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # TODO: ADD WHEN THERE'S A LICENSE FILE TO ADD.
  # mkdir   -p     "${pkgdir}/usr/share/${pkgname}"
  # install -Dm644 "LICENSE"                                     "${pkgdir}/usr/share/${pkgname}/LICENSE"
}
