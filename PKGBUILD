# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=candlelang-git
pkgver=1.0.0.r2.g8dc4176
pkgrel=1
pkgdesc="The latest git vcersion of Candlelang"
arch=("x86_64" "aarch64")
source=("$pkgname::git+https://github.com/aureumapes/candle")
url="https://github.com/aureumapes/candle"
license=('MIT')
conflicts=('candle')
makedepends=('git' 'go>=1.21')
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/$pkgname"

	version=$(git tag -l --sort=-v:refname | sed 's/v\([^-].*\)/\1/g' | head -1)
	release=$(git describe --long --tags | sed 's/\([^-].*\)-\([0-9]*\)-\(g.*\)/r\2.\3/g')

	echo "${version}.${release}" | sed -re 's/-//g' # strip hyphen
}

build() {
	cd "$srcdir/$pkgname"
	go build
}

package() {
	cd "$srcdir/$pkgname"
	install -vDm777 -t "$pkgdir/usr/bin" candle
}
