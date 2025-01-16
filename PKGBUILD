# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>
pkgname=naga-cli
pkgver=24.0.0
pkgrel=1
pkgdesc="Shader translation command line tool"
arch=('x86_64' 'i686')
url='https://github.com/gfx-rs/wgpu/tree/trunk/naga-cli'
license=('MIT OR Apache-2.0')
makedepends=('cargo')
provides=('naga')
conflicts=('naga')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('77be7350b46f25941118deb7b9c76affcb96a561799d42faef02d27c813947fafbe176002fc7e9e8aeb598ea78fa9bb870c4131b89b677f4ac27151b06291996')

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
