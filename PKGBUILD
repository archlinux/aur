# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-cpp
pkgver=0.1.0
pkgrel=1
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
_commit='0e6e5293c9b42e9ace974268e2e5a9f27e7cddaa'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('f4f02c6da2c8f381e03508cdf0cbb00c093e4eb27d813b761fc1761a5c48cff8')

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
