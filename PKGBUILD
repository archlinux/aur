# Maintainer: Jaco Malan <jacom@codelog.co.za>

pkgbase=vertebrae-git
pkgname=vertebrae-git
pkgver=0.1.0.r0.gf7432fd
pkgrel=1
pkgdesc="A configurable, automatic backup management utility written in Rust."
arch=('x86_64')
url="https://github.com/JacoMalan1/vertebrae"
license=('GPL-3.0-or-later')
depends=(gcc-libs gmp lib32-gmp mpfr libmpc)
makedepends=('cargo' 'git' 'gcc')
provides=('vertebrae')
conflicts=('vertebrae')
source=("$pkgbase::git+https://github.com/JacoMalan1/vertebrae.git")
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
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	cp "$srcdir/$pkgbase/target/release/vertebraed" "$pkgdir/usr/bin"
	cp "$srcdir/../vertebraed@.service" "$pkgdir/usr/lib/systemd/system/"
}
