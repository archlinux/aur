# Maintainer: Kuokuo123 <kuoyu1204@gmail.com>
pkgname="otter-launcher"
pkgver=0.8.1
# v0.8.0 is a generational update that comes with breaking changes. Check the github repo for config migration guide if you come from earlier versions: https://github.com/kuokuo123/otter-launcher/
pkgrel=1
pkgdesc="A rust-based cli/tui launcher built for keyboard-centric users, featuring vi & emacs keybinds, ascii decoration, etc"
arch=("x86_64" "aarch64")
url="https://github.com/kuokuo123/otter-launcher"
license=('GPL-3.0')
makedepends=(git cargo)
options=(!debug)
backup=("etc/otter-launcher/config.toml")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuokuo123/otter-launcher/archive/v${pkgver}.tar.gz")

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
sha256sums=('a06a7225d33257976d0824055535f9d6de63be9ee356120b6d2bbf13e331da61')
