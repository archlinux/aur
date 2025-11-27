# Maintainer: Aeldit <aeldit.66@proton.me>

pkgname=lbn
pkgver=1.1.3
pkgrel=1
pkgdesc="Lightweight program (~2MB of RAM) that sends a notification to the user's desktop when battery percentage drops bellow 20, 10 and 5 %"
arch=("any")
url="https://git.sr.ht/~aeldit/lbn"
license=("GPL-3.0-only")
depends=(
	glibc
	gcc-libs
)
makedepends=(cargo)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=("ef7710c4f4492437ab8fdb0312bb90de609c76607e035c756656d79c7714dd08")

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
