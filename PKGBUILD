pkgname=wasm-component-ld
_commit=ef524ad0747ebe0060feb5060753642ea98bad4b
pkgver=0.5.0
pkgrel=1
pkgdesc="Command line linker for creating WebAssembly components"
arch=(x86_64)
url="https://github.com/bytecodealliance/wasm-component-ld"
license=(MIT APACHE APACHE-2.0)
makedepends=(
cargo
git
)
depends=(
gcc-libs
glibc
)
source=("git+https://github.com/bytecodealliance/wasm-component-ld.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd wasm-component-ld
	git describe --tags | sed 's/^v//'		
}

prepare() {
        cd wasm-component-ld
        export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
        cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

#check() {
#	cd wasm-component-ld
#	export RUSTUP_TOOLCHAIN=stable
#	export CARGO_TARGET_DIR=target
#	cargo test --locked --offline --all-features
#}


package() {
        cd wasm-component-ld
        export RUSTUP_TOOLCHAIN=stable
        cargo install --no-track --locked --offline --all-features --target-dir target --root "$pkgdir/usr/" --path .
}

