# Maintainer: Atif Chowdhury <iftakhar.awal@gmail.com>
pkgname=xcolor-git
pkgver=0.5.0.101.gf23338a
pkgrel=1
pkgdesc="Lightweight color picker for X11"
arch=(x86_64)
url="https://github.com/Soft/xcolor"
license=(MIT)
depends=("libxcb")
makedepends=("rust" "cargo" "python")
source=("$pkgname::git+https://github.com/Soft/xcolor.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/xcolor "$pkgdir/usr/bin/xcolor"
	install -Dm644 man/xcolor.1 "$pkgdir/usr/share/man/man1/xcolor.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
