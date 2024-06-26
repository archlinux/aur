# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: aureumapes <auruemapes@duck.com>
pkgname=candlelang-git
pkgver=candle1.1.1
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
	cd $srcdir/$pkgname

	version=$(git describe --tags --abbrev=0 | sed "s/-/_/g")

	echo "${version}"
}

build() {
	cd $srcdir/$pkgname
	go generate
	go build
}

package() {
	cd $srcdir/$pkgname
	install -vDm777 -t $pkgdir/usr/bin candle
}
