# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=git-barber
pkgver=0.3.0
pkgrel=1
_repo=git-barber
_tag=v0.3.0
_srcdir="$_repo-$pkgver"
pkgdesc="A CLI and TUI for cleaning up merged Git branches, including squash and rebase merges"
arch=('x86_64')
url="https://github.com/rekurt/git-barber.git"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'git')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rekurt/git-barber/archive/refs/tags/$_tag.tar.gz")
sha256sums=('f4ddf3dadc27b65b3553ac186fae6f9fb9c26da9d3ea247ce61ec5db250ebba8')

build() {
	cd "$_srcdir"
	cargo build --release --locked
}

check() {
	cd "$_srcdir"
	cargo test --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 target/release/git-barber "$pkgdir/usr/bin/git-barber"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
