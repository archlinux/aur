# Maintainer: Ashton Grimes <amgrimes2002@gmail.com>

pkgname=cpcli-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Check crypto prices in your terminal"
arch=(x86_64 i686 aarch64 armv7)
url="https://github.com/AshtonGrimes/cpcli"
license=(GPL-3.0-or-later)
depends=(glibc gcc-libs openssl)
makedepends=(git rust)
source=("git+https://github.com/AshtonGrimes/cpcli")
sha256sums=(SKIP)

pkgver() {
	cd cpcli
	grep '^version' Cargo.toml | head -n1 | sed -E 's/.*"(.*)"$/\1/'
}

build() {  
	cd cpcli
	CFLAGS="-O2 -pipe" CXXFLAGS="-O2 -pipe" cargo build --locked --release
}

package() {
	cd cpcli
	install -Dm755 target/release/cpcli -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
