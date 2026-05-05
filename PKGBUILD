# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-cpp
pkgver=0.1.0
pkgrel=4
pkgdesc='Interactive wlroots/Hyprland region screenshot tool with image and file clipboard support'
arch=('x86_64')
url='https://github.com/xander-lin/screenshot'
license=('MIT')
depends=(
  'cairo'
  'grim'
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'meson'
  'ninja'
  'wayland-protocols'
  'wlr-protocols'
)
optdepends=(
  'wl-clipboard: inspect clipboard MIME types with wl-paste'
  'hyprland: tested wlroots compositor environment'
  'sway: alternative wlroots compositor environment'
)
_commit='537793791e7b308468daedbcdfddcd0ccc02cbba'
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://codeload.github.com/xander-lin/screenshot/tar.gz/${_commit}")
sha256sums=('9ae739d8b788e5877c5f39ba3a852ad28cb3d4a3210edf335aa8c472eacf4ad4')

build() {
  arch-meson "${srcdir}/screenshot-${_commit}" "${srcdir}/build"
  meson compile -C "${srcdir}/build"
}

package() {
  meson install -C "${srcdir}/build" --destdir "${pkgdir}"

  install -Dm644 "${srcdir}/screenshot-${_commit}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/screenshot-${_commit}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/screenshot-${_commit}/README.en.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.en.md"
}
