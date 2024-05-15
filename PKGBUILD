# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-webapps
pkgver=0.4.0
pkgrel=1
pkgdesc="Web App Manager written with love and libcosmic."
arch=('x86_64')
url="https://github.com/elevenhsoft/WebApps"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'git' 'openssl')
makedepends=('cargo' 'just')
conflicts=('cosmic-wam')
source=("git+https://github.com/elevenhsoft/WebApps.git#tag=$pkgver")
sha256sums=('07458ef86e87b3ad0f1f965c8e89f060d7d839b088c43aaa6c9a5eb75925436e')

prepare() {
  cd WebApps
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd WebApps
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  # Package contains reference to $srcdir
  RUSTFLAGS="$RUSTFLAGS --remap-path-prefix $PWD=/"

  just build-vendored
}

package() {
  cd WebApps
  just rootdir="$pkgdir" install
}
