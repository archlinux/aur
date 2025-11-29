# Maintainer: Gilwiljam <gillbilljam@gmail.com>
pkgname=astro_modloader
pkgver=0.1.15
pkgrel=1
pkgdesc="A modloader for Astroneer in Rust."
arch=('x86_64')
url="https://github.com/AstroTechies/astro_modloader"
license=('MIT')
makedepends=('rust' 'cargo-about' 'gendesk')
optdepends=('steam: For Astroneer on Linux')
source=("https://github.com/AstroTechies/astro_modloader/archive/refs/tags/0.1.15.tar.gz") 
options=(!lto)
b2sums=('77ea6ec0596f4307b2a84682bcabadf69d22a3e3a0045ab7ce4980d2107ee85b466f215285090c761151d987012ee0ca94a43bcbcda25ec2a65c07fa727c3f97')
provides=('astro_modloader')

build() { 
	export USE_PRECOMPILED_CPP_LOADER=1
	export USE_PREBUILT_ASSETS=1   
	echo If using Rustup, make sure Rust is installed.  
	gendesk
	cd "$srcdir/$pkgname-$pkgver"  
	cargo about init
	cargo build --release  
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname" 
	install -Dm644 "$srcdir/astro_modloader.desktop" -t "$pkgdir/usr/share/applications/" 
	rm -rf $srcdir/astro_modloader.*
}
