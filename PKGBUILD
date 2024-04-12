# Maintainer: <Charklie charliejohanid@gmail.com>
pkgname=rsftch-git
_pkgname=rsftch
pkgver=0.4.5
pkgrel=1
pkgdesc="Lightning fast hardware fetch tool written in rust."
url="https://github.com/charklie/rsftch"
depends=('cargo' 'pciutils' 'sqlite' 'gcc-libs' 'glibc')
makedepends=('git')
license=("MIT")
arch=("x86_64" "aarch64")
provides=("rsftch")
conflicts=("rsftch")
source=("git+https://github.com/charklie/rsftch.git")
sha256sums=("SKIP")

build() {
	cd "$_pkgname"
	git config http.postBuffer 524288000
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --offline --release
}

package() {
	cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
