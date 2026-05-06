# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-cpp
pkgver=0.1.0
pkgrel=5
pkgdesc='Interactive wlroots/Hyprland region screenshot tool with image clipboard and optional file-reference mode'
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
_commit='404fe3f82a80b341542c4e13428b4eb0b4361d3c'
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://codeload.github.com/xander-lin/screenshot/tar.gz/${_commit}")
sha256sums=('8bab80570d775d70625150e9acfb53f2935317d243d2051e54560bc88c5ac720')

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
