# Maintainer: Gilwiljam <gillbilljam@gmail.com>
pkgname=astro_modloader
pkgver=0.1.16
pkgrel=1
pkgdesc="A modloader for Astroneer in Rust."
arch=('x86_64')
url="https://github.com/AstroTechies/astro_modloader"
license=('MIT')
makedepends=('rust' 'cargo-about' 'gendesk')
optdepends=('steam: For Astroneer on Linux')
source=("https://github.com/AstroTechies/astro_modloader/archive/refs/tags/${pkgver}.tar.gz") 
options=(!lto)
b2sums=('2b6246a31b63d2b017661b71e96dd2c0820191c0b5906b6a88f41b3bc0303e0db075cc4510c93d8d8f4ce2f8f27aa32ec8931f392c65b08e4e9e9cd0f62494cc')
provides=('astro_modloader')

build() { 
	export USE_PRECOMPILED_CPP_LOADER=1
	export USE_PREBUILT_ASSETS=1   
	echo If using Rustup, make sure Rust is installed.  
	gendesk -f
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
