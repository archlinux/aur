pkgname=astro_modloader
pkgver=0.1.14
pkgrel=1
pkgdesc="A modloader for Astroneer in Rust."
arch=('x86_64')
url="https://github.com/AstroTechies/astro_modloader"
license=('MIT')
makedepends=('git' 'rust' 'cargo-about' 'gendesk')
optdepends=('steam: For Astroneer on Linux')
source=("git+https://github.com/AstroTechies/astro_modloader.git") 
options=(!lto)
sha256sums=('SKIP')


build() { 
	export USE_PRECOMPILED_CPP_LOADER=1
	export USE_PREBUILT_ASSETS=1   
	echo If using Rustup, make sure Rust is installed.  
	gendesk
	cd "$srcdir/$pkgname"  
	cargo about init
	cargo build --release  
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname" 
	install -Dm644 "$srcdir/astro_modloader.desktop" -t "$pkgdir/usr/share/applications/" 
	rm -rf $srcdir/astro_modloader.*
}
