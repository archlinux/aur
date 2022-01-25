pkgname=frogfetch-git
pkgver=v0.1.0.r1.g641e713
pkgrel=1
pkgdesc="Neofetch but frogged and in rust"
url="https://git.karx.xyz/famfo/frogfetch-rs"
license=("GPL")
arch=("x86_64")
makedepends=("git" "rust")
provides=("frogfetch-rs")
conflicts=("frogfetch-bin")
source=("git+https://git.karx.xyz/famfo/frogfetch-rs.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/frogfetch-rs"
	git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/frogfetch-rs"
	cargo build --release
}

package() {
	cd "$srcdir/frogfetch-rs/target/release"
	mv frogfetch-rs frogfetch
	install -Dm755 frogfetch -t "$pkgdir/usr/bin"
}
