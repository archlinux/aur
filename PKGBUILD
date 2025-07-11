# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>
pkgname=naga-cli
pkgver=26.0.0
pkgrel=1
pkgdesc="Shader translation command line tool"
arch=('x86_64' 'i686')
url='https://github.com/gfx-rs/wgpu/tree/trunk/naga-cli'
license=('MIT OR Apache-2.0')
makedepends=('cargo')
provides=('naga')
conflicts=('naga')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('8abf6b3ca68f76ecd98c0683e1bc421acd57544ee8371f8da94b31aeedebb2ae6b18c35278167f32f31eb6a44d93d61b64667a3109a66f7d54fc9b8c6022d32e')

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
