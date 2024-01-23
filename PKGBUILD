# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname=servicer
pkgver=0.1.13
pkgrel=1
pkgdesc="Simplify service management on systemd"
url="https://github.com/servicer-labs/servicer"
license=("MIT")
arch=("x86_64" "aarch64")
provides=("servicer")
conflicts=("servicer")
_tag=5cf82e8ff6947278b46887b09161bc72b05b04d5 # git rev-parse v${pkgver}
source=("$pkgname::git+$url#tag=${_tag}")
makedepends=("git" "rust")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname"
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/servicer "${pkgdir}/usr/bin/servicer"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
