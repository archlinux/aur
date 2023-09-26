# Maintainer: Michał Szmidt  <michal.sz@disroot.org>
pkgname=hctl
pkgver=0.2.4
pkgrel=1
pkgdesc="CLI Tool to transform, merge, remove duplicates, validate hostlists for dns adblocker."
# hctl is known to build on many architectures, those below are just known to build on other build systems like Alpine Linux and SUSE OBS, feel free to add
arch=(x86_64 i686 i586 aarch64 riscv64 s390x ppc64le ppc64 armhf armv7 )
url="https://github.com/michalszmidt/hctl"
license=(BSD-3-Clause)
depends=(openssl)
makedepends=( openssl rust cargo-auditable base-devel )
source=("https://github.com/michalszmidt/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c78c87262c0aa247db65b59886c48bdc094f89e50d59a5c131689f2e4f8b2901')

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
