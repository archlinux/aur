# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=quick-webapps
pkgver=0.4.6
pkgrel=1
pkgdesc="Web App Manager for Cosmic desktop written with love and libcosmic."
arch=('x86_64')
url="https://github.com/elevenhsoft/WebApps"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'libxkbcommon' 'openssl')
makedepends=('cargo' 'git' 'just')
conflicts=('cosmic-wam' 'cosmic-webapps')
source=("git+https://github.com/elevenhsoft/WebApps.git#tag=$pkgver")
sha256sums=('19ce60f91de407acbb14511436c43e261ef58e1fbb38e0f02b46855e5392fe42')

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
