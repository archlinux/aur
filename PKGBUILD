# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=quick-webapps
pkgver=0.5.2
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
sha256sums=('a1f282ede5aa880097d4564343e0a05caef01767f08cda3145ab4ec7df329f6a')

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
