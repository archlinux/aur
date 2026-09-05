# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=hysp
pkgver=0.1.2
pkgrel=1
pkgdesc="An independent, cross-platform package manager for CTF/hacking tools"
arch=('x86_64')
url="https://github.com/pwnwriter/hysp"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.1.2"
_srcdir="hysp-0.1.2"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/pwnwriter/hysp/tar.gz/refs/tags/$_tag")
sha256sums=('c26ce30bc296d07050e3fcacc21a7b52f8b6382b6c64b4af8f164338f0e22261')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/hysp" "$pkgdir/usr/bin/hysp"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
	if [ -f README.md ]; then
		install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	fi
}
