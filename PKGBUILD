# Maintainer: Jaco Malan <jacom@codelog.co.za>

pkgbase=strain-git
pkgname=strain-git
pkgver=0.0.6.r0.g8222234
pkgrel=1
pkgdesc="A CPU stressing tool written in Rust"
arch=('x86_64')
url="https://github.com/JacoMalan1/strain"
license=('GPL-3.0-or-later')
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
  CARGO_TARGET_DIR=./target cargo build --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/$pkgbase/target/release/strain" "$pkgdir/usr/bin"
}
