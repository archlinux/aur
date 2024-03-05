# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>

_app_id="com.nintendo.SuperMarioBros2"
_title="Super Mario Bros 2"
_rom_filename=""
pkgname=super-mario-bros-2
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
url="https://en.wikipedia.org/wiki/Super_Mario_Bros._2"
depends=(
  fceux
)
makedepends=()
_archive="https://archive.org/download"
license=(
  "custom"
)
_dmca_exemption="https://archive.org/about/dmca.php"
source=(
  "${_app_id}.nes::${_archive}/nes-roms/Super%20Mario%20Bros.%202%20%28USA%29.nes"
  "nes-template.desktop"
  "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/0/00/Super_Mario_Bros_2.jpg"
)
sha256sums+=(
  "47ba60fad332fdea5ae44b7979fe1ee78de1d316ee027fea2ad5fe3c0d86f25a"
  "209068f2ee7bfb33cea86a516d8c0625a206a8157a1d78b0a80b058a3202d1a8"
  "a9e5b5bda9a15eb96bc8a861a5876af498a53070f3b0e29858eeb424e34e2c1b"
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
