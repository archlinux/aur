# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=tascli
pkgver=0.14.1
pkgrel=2
pkgdesc="A simple, fast, local task and record manager in CLI"
arch=('x86_64')
url="https://github.com/Aperocky/tascli"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.14.1"
_srcdir="tascli-0.14.1"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/Aperocky/tascli/tar.gz/refs/tags/$_tag")
sha256sums=('e7ce1b10383724bac04ca8927895693945838e8bee5c43cf89c4ab458b65fb1d')

prepare() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/tascli" "$pkgdir/usr/bin/tascli"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -Dm644 SKILL.md "$pkgdir/usr/share/doc/$pkgname/SKILL.md"
	install -Dm644 AGENTS.md "$pkgdir/usr/share/doc/$pkgname/AGENTS.md"
	install -d "$pkgdir/usr/share/$pkgname/bench" "$pkgdir/usr/share/$pkgname/demo"
	install -Dm755 bench/*.sh bench/README.md "$pkgdir/usr/share/$pkgname/bench/"
	install -Dm644 demo/* "$pkgdir/usr/share/$pkgname/demo/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
