# Maintainer: Jaco Malan <jacom@codelog.co.za>

pkgbase=strain-git
pkgname=strain-git
pkgver=0.0.1.r1.g9b43a3f
pkgrel=1
pkgdesc="A CPU stressing tool written in Rust"
arch=('x86_64')
url="https://github.com/JacoMalan1/strain"
license=('MIT')
depends=(gcc-libs gmp lib32-gmp mpfr libmpc)
makedepends=('cargo' 'git' 'gcc')
provides=('strain')
conflicts=('strain')
source=("$pkgbase::git+https://github.com/JacoMalan1/strain.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgbase"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgbase"
  CARGO_TARGET_DIR=./target cargo build --frozen --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/$pkgbase/target/release/strain" "$pkgdir/usr/bin"
}
