# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ren-find
pkgver=0.0.4
pkgrel=2
pkgdesc="Batch rename utility that takes find-formatted lines via stdin"
arch=('x86_64')
url="https://github.com/robenkleene/ren-find"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="0.0.4"
_srcdir="ren-find-0.0.4"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/robenkleene/ren-find/tar.gz/refs/tags/$_tag")
sha256sums=('9f1d7e20773985a3dbdd707a409585ea686d95949b0a02bffda2000207e21267')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/ren" "$pkgdir/usr/bin/ren"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 RELEASING.md "$pkgdir/usr/share/doc/$pkgname/RELEASING.md"
	install -Dm644 ren.gif "$pkgdir/usr/share/doc/$pkgname/ren.gif"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
