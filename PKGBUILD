# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-cpp
pkgver=0.1.0
pkgrel=7
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
  'git'
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
_commit='22d0bd7dcae9761e2c66bcc07a6b5a3ca34b1759'
_github_url='https://github.com/xander-lin/screenshot.git'
_gitee_url='https://gitee.com/xander-lin/screenshot.git'
source=()
sha256sums=()

prepare() {
  rm -rf "${srcdir}/screenshot"
  git clone "${_github_url}" "${srcdir}/screenshot" || \
    git clone "${_gitee_url}" "${srcdir}/screenshot"
  git -C "${srcdir}/screenshot" checkout "${_commit}"
}

build() {
  arch-meson "${srcdir}/screenshot" "${srcdir}/build"
  meson compile -C "${srcdir}/build"
}

package() {
  meson install -C "${srcdir}/build" --destdir "${pkgdir}"

  install -Dm644 "${srcdir}/screenshot/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/screenshot/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/screenshot/README.en.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.en.md"
}
