# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=frep
pkgver=0.1.4
pkgrel=1
pkgdesc="Fast find-and-replace tool; search and replace in files or stdin"
arch=('x86_64')
url="https://github.com/thomasschafer/frep"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.1.4"
_srcdir="frep-0.1.4"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/thomasschafer/frep/tar.gz/refs/tags/$_tag")
sha256sums=('45753c1e0d24fa206dff615f27993eaa796f0d9160d44ae7477916a58c6df6b1')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/frep" "$pkgdir/usr/bin/frep"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
