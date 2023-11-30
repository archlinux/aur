# Maintainer: Mark Wagie <mark at proton dot me>
# Co-Maintainer: soloturn <soloturn@gmail.com>
pkgname=cosmic-edit-git
pkgver=r218.54362ec
pkgrel=1
pkgdesc="COSMIC Text Editor"
arch=('x86_64')
url="https://github.com/pop-os/cosmic-edit"
license=('GPL3')
depends=('cosmic-icons' 'gtk3' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-text-editor')
replaces=('cosmic-text-editor-git')
options=('!lto')
source=('git+https://github.com/pop-os/cosmic-edit.git')
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
