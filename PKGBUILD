# Maintainer: Olaf Wriggers <olaf at olwig dot xyz>
pkgname=cosmic-ext-applet-privacy-indicator
pkgver=0.1.2
pkgrel=2
pkgdesc="Privacy indicator for the COSMIC Desktop"
arch=('x86_64')
url="https://github.com/D-Brox/cosmic-ext-applet-privacy-indicator"
license=('GPL3')
depends=(
    'cosmic-applets'
    'libxkbcommon'
    'fontconfig'
    'libpipewire'
)
makedepends=(
  'cargo'
  'just'
  'clang'
  'llvm'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8080dc05291d655cef9278dd82e37758e325d40e2a5319add1796a33659d5b2d')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  just rootdir="$pkgdir" install
}