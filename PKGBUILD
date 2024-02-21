# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-panel-git
pkgver=r352.98f6180
pkgrel=1
pkgdesc="WIP COSMIC Panel"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-panel"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/pop-os/cosmic-panel.git')
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
