pkgname=scrcpy-wrapper
pkgver=0.1.6
pkgrel=1
pkgdesc='A simple wrapper for scrcpy'
url='https://github.com/Bluemangoo/scrcpy-wrapper'
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('scrcpy')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bluemangoo/$pkgname/archive/refs/tags/$pkgver.tar.gz")
b2sums=('8703630a2c790712ae57abe941f8c1ea986b6792f9117b86db01fc1a7381cbf493ab537f0cde9f84659fd0d44606cb638f3e8f4076dc9a2973b9ef941126e772')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/$pkgname"
}
