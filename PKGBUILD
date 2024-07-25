# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-randr-git
pkgver=r24.e214fe9
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
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-randr.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  nice just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
