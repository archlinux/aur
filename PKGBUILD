# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>
pkgname=naga-cli
pkgver=25.0.0
pkgrel=1
pkgdesc="Shader translation command line tool"
arch=('x86_64' 'i686')
url='https://github.com/gfx-rs/wgpu/tree/trunk/naga-cli'
license=('MIT OR Apache-2.0')
makedepends=('cargo')
provides=('naga')
conflicts=('naga')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('c4dc721b610dde9cde57fa597f5fd4a21aff24986494d0752e1e574e118b8d6260927dccccf1a4900d90f5d7ad8692df43f79193cea9e1ac97c7e35d3db89081')

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
