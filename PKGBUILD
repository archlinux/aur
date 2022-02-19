# Maintainer: Kaedwen <phi.devel.de@gmail.com>
pkgname=rmenu
pkgver=0.1.0
pkgrel=1
pkgdesc='Dynamic Wayland Menu Launcher'
source=("$pkgname-$pkgver.tar.gz::https://github.com/kaedwen/rmenu/archive/refs/tags/$pkgver-$pkgrel.tar.gz")
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('cargo')
sha256sums=('27fc8d1a4eed1ad8d4311c72459a0c8f1ae91a06347d5884138294517d7c3708')

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
