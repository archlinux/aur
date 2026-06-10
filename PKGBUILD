# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-rs
pkgver=0.1.0
pkgrel=10
pkgdesc='Pure Rust interactive wlroots/Hyprland region and long screenshot tool'
arch=('x86_64')
url='https://github.com/xander-lin/screenshot'
license=('MIT')
options=(!debug)
conflicts=(screenshot-cpp)
replaces=(screenshot-cpp)
depends=(
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
)
optdepends=(
  'hyprland: tested wlroots compositor environment'
  'sway: alternative wlroots compositor environment'
)
_commit='64b73227857fe796f0dba778de5fd656a634986c'
_github_url='https://github.com/xander-lin/screenshot.git'
_gitee_url='https://gitee.com/xander-lin/screenshot.git'
source=()
sha256sums=()

prepare() {
  rm -rf "${srcdir}/screenshot"
  git clone "${_gitee_url}" "${srcdir}/screenshot" || \
    git clone "${_github_url}" "${srcdir}/screenshot"
  git -C "${srcdir}/screenshot" checkout "${_commit}"
}

build() {
  cd "${srcdir}/screenshot"
  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/screenshot/target/release/screenshot" \
    "${pkgdir}/usr/bin/screenshot"
  install -Dm644 "${srcdir}/screenshot/screenshot.1" \
    "${pkgdir}/usr/share/man/man1/screenshot.1"

  install -Dm644 "${srcdir}/screenshot/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/screenshot/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/screenshot/README.en.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.en.md"
}
