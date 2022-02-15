# Maintainer: regular-dev.org <regular-dev@gmail.com>
pkgname=cmake_tui
pkgver=1.0.0
pkgrel=1
pkgdesc="CMake configuration via terminal user interface"
license=('MIT')
arch=('x86_64')
makedepends=('rust')
provides=('cmake_tui')
conflicts=('cmake_tui')

depends=('cmake' 'gcc' 'make')
url='https://github.com/regular-dev/cmake_tui'

source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('34207502d386791a87c651b7568256d3ebdb85d406073a2b18ce22a15f9f567129833bf94a4cdaf03ad552f70bf5b247b1a5b8ce6203be936c4e95634b1e8ce8')


build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/$pkgname"
}
