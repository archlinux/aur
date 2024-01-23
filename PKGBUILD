# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname=servicer-git
_pkgname=servicer
pkgver=v0.1.13.r4.ged8f31c
pkgrel=1
pkgdesc="Simplify service management on systemd"
url="https://github.com/servicer-labs/servicer"
license=("MIT")
arch=("x86_64" "aarch64")
provides=("servicer")
conflicts=("servicer")
source=("git+$url")
depends=("glibc" "gcc-libs")
makedepends=("git" "rust")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_pkgname"
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 target/release/servicer "${pkgdir}/usr/bin/servicer"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
