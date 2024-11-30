# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=quick-webapps
pkgver=0.5.4
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
  'just'
)
conflicts=('cosmic-wam' 'cosmic-webapps')
source=("web-apps-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3cb507cd931ef64b7e887b2b918b9c44a590d2addc438e774dc7ecfa8b156af6')

prepare() {
  cd web-apps-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd web-apps-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd web-apps-$pkgver
  just rootdir="$pkgdir" install
}
