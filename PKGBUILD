# Maintainer: Kuokuo123 <kuoyu1204@gmail.com>
pkgname="otter-launcher"
pkgver=0.7.5
pkgrel=1
pkgdesc="A rust-based cli/tui launcher built for keyboard-centric users, featuring vi & emacs keybinds, ascii decoration, etc"
arch=("x86_64" "aarch64")
url="https://github.com/kuokuo123/otter-launcher"
license=('GPL-3.0')
makedepends=(git cargo)
options=(!debug)
backup=("etc/otter-launcher/config.toml")
source=("https://github.com/kuokuo123/otter-launcher/archive/refs/tags/v0.7.5.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release 
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/config_example/config.toml" "${pkgdir}/etc/$pkgname/config.toml"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/ot"
}
sha256sums=('009762876d0d4bae85cfd6ee571a85b06caba8eef25ee8cf01f8485e37a9612b')
