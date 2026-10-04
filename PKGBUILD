# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=fstk
pkgver=0.2.3
pkgrel=2
pkgdesc="Stack-based file & directory manager: modern cut/paste alternative to mv"
arch=('x86_64')
url="https://github.com/archsyscall/fstk"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.2.3"
_srcdir="fstk-0.2.3"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/archsyscall/fstk/tar.gz/refs/tags/$_tag")
sha256sums=('93c2863dad02795c9b40af966ff28954465b86ec3f023f9c77e88529c1a84b46')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/fstk" "$pkgdir/usr/bin/fstk"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 <("$pkgdir/usr/bin/fstk" completion bash) "$pkgdir/usr/share/bash-completion/completions/fstk"
	install -Dm644 <("$pkgdir/usr/bin/fstk" completion zsh) "$pkgdir/usr/share/zsh/site-functions/_fstk"
	install -Dm644 <("$pkgdir/usr/bin/fstk" completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/fstk.fish"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
