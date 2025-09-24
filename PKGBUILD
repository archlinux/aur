# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=quick-webapps
pkgver=2.0.0
pkgrel=1
pkgdesc="Web App Manager for the COSMIC™ desktop written with love and libcosmic."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/web-apps"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'libxkbcommon'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
conflicts=('cosmic-wam' 'cosmic-webapps')
source=("git+https://github.com/cosmic-utils/web-apps.git#tag=$pkgver")
sha256sums=('174f8f909b8ea44f676d857817c4eb3f77092750052fcc22c2deb57b58461f41')

prepare() {
  cd web-apps
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd web-apps
  export RUSTUP_TOOLCHAIN=stable
  just build-release
}

package() {
  cd web-apps
  just rootdir="$pkgdir" prefix='/usr' install
}
