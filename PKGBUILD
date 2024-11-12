# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>
pkgname=naga-cli
pkgver=23.0.0
pkgrel=2
pkgdesc="Shader translation command line tool"
arch=('x86_64' 'i686')
url='https://github.com/gfx-rs/wgpu/tree/trunk/naga-cli'
license=('MIT OR Apache-2.0')
makedepends=('cargo')
provides=('naga')
conflicts=('naga')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('9433f8b96a63943fdf29636fee1c30bd2c256167aa4e20423baf18a16d99786d4b68ad1603b03b51a956badb80923eef0f06232e3b463de39326bfc5dd0126a9')

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
