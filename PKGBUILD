# Maintainer: Aeldit <aeldit.66@proton.me>

pkgname=lbn
pkgver=1.1.8
pkgrel=1
pkgdesc="Lightweight program (~2MB of RAM) that sends a notification to the user's desktop when battery percentage drops bellow 20, 10 and 5 %"
arch=("any")
url="https://git.sr.ht/~aeldit/lbn"
license=("GPL-2.0-only")
depends=(
	glibc
	gcc-libs
)
makedepends=(cargo)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=("1aa4bbf1bfd33e65f70e42eba37d2abee230ce075e1b81394f440da602a36419")

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
