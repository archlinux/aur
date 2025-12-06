# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=servicer
pkgver=0.1.13
pkgrel=1
pkgdesc="Simplify service management on systemd"
url="https://github.com/servicer-labs/servicer"
license=("MIT")
arch=("x86_64" "aarch64")
provides=("servicer")
conflicts=("servicer")
source=("$pkgname::git+$url#tag=v$pkgver")
makedepends=("git" "rust")
sha512sums=('9f46882fcd83726b562b85773650f45186ff9fcfc193d442eb58f5ad7b8d4290549372ccb918293b4439df6c8a4ea3f9f9d97c1d4fc0df39c3438b2635150e8e')

prepare() {
	cd $pkgname
	cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd $pkgname
	cargo build --frozen --release --all-features
}

package() {
	cd $pkgname
	install -Dm755 target/release/servicer "$pkgdir/usr/bin/servicer"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
