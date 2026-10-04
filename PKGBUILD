# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rsnip
pkgver=0.7.0
pkgrel=5
pkgdesc="A powerful command-line snippet manager"
arch=('x86_64')
url="https://github.com/sysid/rsnip"
license=('custom')
depends=()
makedepends=('cargo')
_tag="v0.7.0"
_srcdir="rsnip-0.7.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sysid/rsnip/tar.gz/refs/tags/$_tag")
sha256sums=('13b14fb5a5272e5b7f609bbe710e2933a5c53d972ccb035a0ad6e18621578524')

build() {
	cd "$_srcdir/rsnip"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_PROFILE_RELEASE_LTO=false
	export CARGO_BUILD_JOBS=1
	cargo build --release
}

package() {
	cd "$_srcdir/rsnip"
	install -Dm755 target/release/rsnip "$pkgdir/usr/bin/rsnip"
	install -Dm644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ../Development.md "$pkgdir/usr/share/doc/$pkgname/Development.md"
	install -Dm644 ../doc/runbook.md "$pkgdir/usr/share/doc/$pkgname/runbook.md"
	install -d "$pkgdir/usr/share/$pkgname"
	install -Dm644 rsnip.bash "$pkgdir/usr/share/$pkgname/rsnip.bash"
	install -Dm644 rsnip.alias.bash "$pkgdir/usr/share/$pkgname/rsnip.alias.bash"
	install -Dm644 rsnip.alias.bash.template "$pkgdir/usr/share/$pkgname/rsnip.alias.bash.template"
	install -Dm644 completion_source.txt "$pkgdir/usr/share/$pkgname/completion_source.txt"
	install -Dm644 src/default_completions.txt "$pkgdir/usr/share/$pkgname/default_completions.txt"
	install -Dm644 src/default_config.toml "$pkgdir/usr/share/$pkgname/default_config.toml"
	if [ -f ../LICENSE ]; then
		install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
