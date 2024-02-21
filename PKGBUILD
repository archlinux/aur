# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-files-git
pkgver=r130.4f19123
pkgrel=1
pkgdesc="WIP COSMIC file manager"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-files"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=('glibc')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-files.git')
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
