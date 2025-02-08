# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=quick-webapps
pkgver=1.0.0
pkgrel=1
pkgdesc="Web App Manager for the COSMIC™ desktop written with love and libcosmic."
arch=('x86_64')
url="https://github.com/cosmic-utils/web-apps"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'hicolor-icon-theme'
  'libxkbcommon'
  'openssl'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
conflicts=('cosmic-wam' 'cosmic-webapps')
source=("git+https://github.com/cosmic-utils/web-apps.git#tag=$pkgver")
sha256sums=('9922a2c624942a1d6a770017ee8b41a664160198b752e2812fe4a0d3085af8d9')

prepare() {
  cd web-apps
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd web-apps
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd web-apps
  just rootdir="$pkgdir" install
}
