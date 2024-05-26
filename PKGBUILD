# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-webapps
pkgver=0.4.5
pkgrel=1
pkgdesc="Web App Manager written with love and libcosmic."
arch=('x86_64')
url="https://github.com/elevenhsoft/WebApps"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'libxkbcommon' 'openssl')
makedepends=('cargo' 'git' 'just')
conflicts=('cosmic-wam')
source=("git+https://github.com/elevenhsoft/WebApps.git#tag=$pkgver")
sha256sums=('8736273139f3a81411f9ba233ff49eee3699d4d7c2871ef926bc8966316e5eda')

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
