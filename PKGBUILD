# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-randr-git
pkgver=r15.88c570c
pkgrel=1
pkgdesc="Library and utility for displaying and configuring Wayland outputs"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-randr"
license=('MPL-2.0')
groups=('cosmic')
depends=('wayland')
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/pop-os/cosmic-randr.git')
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
