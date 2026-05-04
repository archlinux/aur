# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-cpp
pkgver=0.1.0
pkgrel=3
pkgdesc='Interactive wlroots/Hyprland region screenshot tool with file-manager clipboard support'
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
  'wl-clipboard: copy screenshots as file references from compositor keybindings'
  'hyprland: tested wlroots compositor environment'
  'sway: alternative wlroots compositor environment'
)
_commit='9c00f795fff0d8d5fe62277235b4d1e6ab1f0476'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('01119eccaaa4899f12acb89ba3d3416941e4850451bee33e8356172211da0307')

build() {
  arch-meson "screenshot-${_commit}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -Dm644 "screenshot-${_commit}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "screenshot-${_commit}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "screenshot-${_commit}/README.en.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.en.md"
}
