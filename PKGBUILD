# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>

_app_id="com.nintendo.SuperMarioBros"
_title="Super Mario Bros"
_rom_filename=""
pkgname=super-mario-bros
pkgver=1.0
pkgrel=1
_pkgdesc=(
  "Platform game developed and published in 1985 by Nintendo"
  "for the Famicom in Japan and for the Nintendo Entertainment"
  "System (NES) in North America"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
url="https://en.wikipedia.org/wiki/Super_Mario_Bros"
depends=(
  fceux
)
makedepends=()
_archive="https://archive.org/download"
license=(
  "custom"
)
_dmca_exemption="https://archive.org/about/dmca.php"
_wiki="https://upload.wikimedia.org/wikipedia"
source=(
  "${_app_id}.nes::${_archive}/nes-roms/Super%20Mario%20Bros.%20%28World%29.nes"
  "nes-template.desktop"
  "${_app_id}.png::${_wiki}/en/0/03/Super_Mario_Bros._box.png"
)
sha256sums+=(
  "f61548fdf1670cffefcc4f0b7bdcdd9eaba0c226e3b74f8666071496988248de"
  "e021676ce1a72920536fad3733b4d5beb703f27da88f3418a517c675f0572a24"
  "a12e6080d1395c195af0a56197f434b15885ba3cab9a488c51acd1b0ef598a8c"
)

prepare() {
  mv \
    nes-template.desktop "${_app_id}.desktop"
  sed \
    -i \
    "s/%_title%/${_title}/g" \
    "${_app_id}.desktop"
  sed \
    -i \
    "s/%pkgdesc%/${pkgdesc}/g" \
    "${_app_id}.desktop"
  sed \
    -i \
    "s/%_app_id%/${_app_id}/g" \
    "${_app_id}.desktop"
  sed \
    -i \
    "s/%_uuid%/${_uuid}/g" \
    "${_app_id}.desktop"
}

package() {
  install \
    -Dm755 \
    "${_app_id}.desktop" \
    "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install \
    -Dm644 \
    "${_app_id}.png" \
    "${pkgdir}/usr/share/icons/${_app_id}.png"
  install \
    -Dm644 \
    "${_app_id}.nes" \
    "${pkgdir}/usr/games/${_app_id}/${_app_id}.nes"
}

# vim:set sw=2 sts=-1 et:
