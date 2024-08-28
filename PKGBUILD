# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>
pkgname=naga-cli
pkgver=22.0.0
pkgrel=2
pkgdesc="Shader translation command line tool"
arch=('x86_64' 'i686')
url='https://github.com/gfx-rs/wgpu/tree/trunk/naga-cli'
license=('MIT OR Apache-2.0')
makedepends=('cargo')
provides=('naga')
conflicts=('naga')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('288c313a57b2bd168e56fd16f26d9467601db246e49ea8689ad929383b718f4569343ef49a89087b61954dbeb72ce6c224b2fc9b6f305d4030aa341e41e49cb6')

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
