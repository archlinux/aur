# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=flashtester
pkgver=0.4.0
pkgrel=1
_repo=FlashTester
_tag=v0.4.0
_srcdir="$_repo-$pkgver"
pkgdesc="Tests USB sticks, SD cards and other disks for fake capacity, data loss and speed, like h2testw plus a quick capacity probe. Runs on Windows, Linux and FreeBSD"
arch=('x86_64')
url="https://flashtester.eu/"
license=('MIT')
depends=('gcc-libs' 'wayland')
optdepends=('udisks2: automatic device detection')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dissimilis/FlashTester/archive/refs/tags/$_tag.tar.gz")
sha256sums=('f54f1962dd5713f3485e0e2945e2550c0dfee0fb122ef6eab829acd12edced56')

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
	install -Dm755 target/release/flashtester "$pkgdir/usr/bin/flashtester"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
