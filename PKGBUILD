# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=lineselect
pkgver=0.2.0
pkgrel=1
pkgdesc="Interactive line selection from stdin for use in shell pipelines"
arch=('x86_64')
url="https://github.com/urbanogilson/lineselect"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.2.0"
_srcdir="lineselect-0.2.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/urbanogilson/lineselect/tar.gz/refs/tags/$_tag")
sha256sums=('adfe2534871f2030d54a19aa3060c8537bce845a6abe529464b365ba44faa2ab')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/lineselect" "$pkgdir/usr/bin/lineselect"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
