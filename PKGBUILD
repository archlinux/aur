# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-screenshot-git
pkgver=r7.98cafde
pkgrel=1
pkgdesc="Utility for capturing screenshots via XDG Desktop Portal"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-screenshot"
license=('GPL-3.0-or-later')
groups=()
depends=(
  'xdg-desktop-portal'
#  'xdg-desktop-portal-cosmic-git' ?
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-screenshot.git')
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
  just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
