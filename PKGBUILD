# Maintainer: Kaedwen <info@kaedwen.org>
pkgname=rmenu
pkgver=0.1.1
pkgrel=1
pkgdesc='Dynamic Wayland Menu Launcher'
source=("$pkgname-$pkgver.tar.gz::https://github.com/kaedwen/rmenu/archive/refs/tags/$pkgver-$pkgrel.tar.gz")
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('cargo')
sha256sums=('f423779308da5d41ccfc023f7f6565e53560d01cd545cadf6de8675193423707')
url='https://github.com/kaedwen/rmenu/'

build () {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  install -Dm755 target/release/rmenu "${pkgdir}/usr/bin/rmenu"
}
