#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291

# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname='puppyclicker'
pkgname="${_pkgname}-appimage"
pkgver=3.5.8
pkgrel=1
pkgdesc='Click your puppies from anywhere. (By KinkyRaven)'
url="https://${_pkgname}.app/"
arch=(
  'x86_64'
  'aarch64'
)
license=('unknown')
_cdn_url="https://cdn${_pkgname}.boundfire.com/build"
makedepends=(
  'grep'
)

source_x86_64=("${_pkgname}.AppImage::${_cdn_url}/linux.AppImage")
b2sums_x86_64=('3f13ef8551658b456c5938aff4853947a560b680863d52dd7787faa7169f72f162b2a8f1009ddf26588715d84e0f4a86c4e5f7fbc12bde58ac43bf2338698a33')
sha512sums_x86_64=('1eb9e7dd960e3ff0031a8d38be40b7eaea95c1635454b3065d2ad0920eff3d10a31e3bd431ce623ad0cf4c611c06ba0bb4d897eaa49bdc23f55b1ead81fe69dd')
sha384sums_x86_64=('ab8784603786b33a079c30fe3fd31e1731ec9c96588f545c1c6b898216e928b23d58c935b2e2de78e24010fc5368c0de')
sha256sums_x86_64=('f5598b9c7cbd16ad79c199802f9b046d9ec225b1d7c61ada219c865b626a4574')

source_aarch64=("${_pkgname}.AppImage::${_cdn_url}/linux-arm64.AppImage")
b2sums_aarch64=('3f13ef8551658b456c5938aff4853947a560b680863d52dd7787faa7169f72f162b2a8f1009ddf26588715d84e0f4a86c4e5f7fbc12bde58ac43bf2338698a33')
sha512sums_aarch64=('1eb9e7dd960e3ff0031a8d38be40b7eaea95c1635454b3065d2ad0920eff3d10a31e3bd431ce623ad0cf4c611c06ba0bb4d897eaa49bdc23f55b1ead81fe69dd')
sha384sums_aarch64=('ab8784603786b33a079c30fe3fd31e1731ec9c96588f545c1c6b898216e928b23d58c935b2e2de78e24010fc5368c0de')
sha256sums_aarch64=('f5598b9c7cbd16ad79c199802f9b046d9ec225b1d7c61ada219c865b626a4574')

pkgver() {
  cd "${srcdir}"
  "./${_pkgname}.AppImage" --appimage-extract &>/dev/null

  grep -oP 'X-AppImage-Version=\K.*' "squashfs-root/${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"

  install -Dm755 "${_pkgname}.AppImage"              "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  (
    cd   'squashfs-root/usr/share/icons/hicolor' && \
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/{}" \;
  )

  # TODO: ADD WHEN THERE'S A LICENSE FILE TO ADD.
  # mkdir   -p     "${pkgdir}/usr/share/${pkgname}"
  # install -Dm644 "LICENSE"                                     "${pkgdir}/usr/share/${pkgname}/LICENSE"
}
