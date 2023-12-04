# Maintainer: Michał Szmidt  <michal.sz@disroot.org>
pkgname=hctl
pkgver=0.2.5
pkgrel=1
pkgdesc="CLI Tool to transform, merge, remove duplicates, validate hostlists for dns adblocker."
# hctl is known to build on many architectures, those below are just known to build on other build systems like Alpine Linux and SUSE OBS, feel free to add
arch=(x86_64 i686 i586 aarch64 riscv64 s390x ppc64le ppc64 armhf armv7 )
url="https://github.com/michalszmidt/hctl"
license=(BSD-3-Clause)
depends=(openssl)
makedepends=( openssl rust cargo-auditable base-devel )
source=("https://github.com/michalszmidt/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d9a67093de0d9de99d3241a031ead07ac11db783e7a190389a879fa9f3360616')

build() {
	cd "$pkgname-$pkgver"
	cargo auditable build --locked --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
