# Maintainer: Benji377 <demetzbenjamin23@gmail.com>
pkgname=Raspirus
pkgver=1.1.3
pkgrel=1
pkgdesc="User- and resources-friendly signatures-based malware scanner"
arch=("x86_64")
url="https://raspirus.deno.dev"
license=('GPL-3.0-only')
# Dependencies from https://tauri.app/v1/guides/getting-started/prerequisites#setting-up-linux
depends=('webkit2gtk' 'curl' 'wget' 'file' 'openssl' 'appmenu-gtk-module' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=('cargo' 'npm')
backup=('etc/Raspirus/Raspirus.json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Raspirus/Raspirus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	npm install
	mkdir out
	cargo install --path src-tauri/
	cargo install tauri-cli --locked
}

build() {
	cd "$pkgname-$pkgver"
	cargo tauri build -b none
}

package() {
	cd "$pkgname-$pkgver"
	cp target/release/raspirus $pkgdir/usr/bin/
}
