# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=biopass
pkgname="$_pkgbase"
pkgver=1.2.0
pkgrel=1
pkgdesc='An alternative to Windows Hello/Howdy'
arch=('x86_64')
url='https://github.com/TickLabVN/biopass'
license=('MIT')
depends=('libwebkit2gtk-4.1.so' 'librsvg-2.so' 'libssl.so' 'libxdo.so')
optdepends=('libayatana-appindicator: for tray icon support')
makedepends=('git' 'bun' 'cmake' 'rust' 'cli11')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=(!lto !debug)
install='setup.install'
source=("$_pkgbase::git+https://github.com/TickLabVN/biopass.git#tag=$pkgver")
sha256sums=('dbbb785f509a6d85b3e09e5a9c9af7c432d8a34bc1801783c31534bb8a7c5c74')

build() {
	cd "$_pkgbase"
	rm -rf app/src-tauri/target/release/bundle/deb/*
	make build
}

package() {
	cd "$_pkgbase"
	cp -r app/src-tauri/target/release/bundle/deb/biopass_*_amd64/data/* "$pkgdir"
	mv "$pkgdir/lib/security" "$pkgdir/usr/lib/security"
	rm -rf "$pkgdir/lib"
}
