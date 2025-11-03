# Maintainer: Kuokuo123 <kuoyu1204@gmail.com>
pkgname="otter-launcher"
pkgver=0.6.4
pkgrel=2
pkgdesc="A rust-based cli/tui launcher built for keyboard-centric users, featuring vi & emacs keybinds, ascii decoration, etc"
arch=("x86_64")
url="https://github.com/kuokuo123/otter-launcher"
license=('GPL-3.0')
makedepends=(git cargo)
options=(!debug)
backup=("etc/otter-launcher/config.toml")
source=("https://github.com/kuokuo123/otter-launcher/archive/refs/tags/v0.6.4.tar.gz")
sha256sums=('3335e1cad6feb644d09bc272a9313f330ca5b6a768fb6e86357b04d0ccdd95b9')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release 
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/config_example/config.toml" "${pkgdir}/etc/$pkgname/config.toml"
	install -Dm644 "$pkgname-$pkgver/config_example/pikachu.example" "${pkgdir}/etc/$pkgname/pikachu.example"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
