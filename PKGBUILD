# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>
pkgname=naga-cli
pkgver=0.19.0
pkgrel=1
pkgdesc="Shader translation command line tool"
arch=('x86_64' 'i686')
ulr=https://github.com/gfx-rs/wgpu/tree/trunk/naga-cli
license=('MIT OR Apache-2.0')
makedepends=('cargo')
provides=('naga')
conflicts=('naga')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('4f076f9d0bb3af93cf14ec5f706eb6bf94973fbbe01a98789b4fb9d0a30c2be6a4487ae34a8278565949dcb6e71595807bcdfa53293e6450faa80ca657e10d80')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo +stable fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo +stable build --frozen --release --target-dir target --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/naga"
}

# vim: set ft=sh ts=4 sw=4 et:
