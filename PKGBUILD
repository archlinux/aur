# Maintainer: Kyuzial <kyuzial@protonmail.com>
pkgname=cosmic-term-git
pkgver=r138.d6946d4
pkgrel=1
pkgdesc="WIP COSMIC Terminal Emulator"
arch=('x86_64')
url="https://github.com/pop-os/cosmic-term"
license=('GPL3')
depends=('libxkbcommon' 'wayland')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
options=('!lto')
source=('git+https://github.com/pop-os/cosmic-term.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
