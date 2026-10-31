# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=bencher
pkgver=0.3.18
pkgrel=1
pkgdesc="Continuous benchmarking platform: catch performance regressions in CI"
arch=('x86_64')
url="https://bencher.dev"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bencherdev/bencher/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0c682ae98fd1f36c0e257fd023bbe7d8540d38e86216723dba2f5b4635af7150')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked -p bencher_cli
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked -p bencher_cli
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/bencher "$pkgdir/usr/bin/bencher"
}
