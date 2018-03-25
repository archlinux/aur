# Maintainer: vimacs <https://vimacs.lcpu.club>

pkgname=mrustc-git
pkgver=0.0.3012
pkgrel=2
pkgdesc='Alternative rust compiler written in C++'
arch=('x86_64')
url='https://github.com/thepowersgang/mrustc'
license=('MIT')
depends=()
makedepends=()
provides=()
conflicts=()
source=('git+https://github.com/thepowersgang/mrustc.git'
	'minicargo-use-system-mrustc.patch')
sha256sums=('SKIP'
	'b2d0ed78257ff18aebdb556532140f43d041468f7da479bac153a9bb88870d5b')

pkgver() {
	cd "$srcdir/mrustc"
	echo 0.0.$(git rev-list --count HEAD)
}

build() {
	cd "$srcdir/mrustc"
	patch -p1 -i "$srcdir/minicargo-use-system-mrustc.patch"
	make
	make -C tools/minicargo
}

package() {
	cd "$srcdir/mrustc"
	install -D bin/mrustc "$pkgdir/usr/bin/mrustc"
	install -D tools/bin/minicargo "$pkgdir/usr/bin/minicargo"
	install -d "$pkgdir/usr/share/mrustc"
	cp -r script-overrides "$pkgdir/usr/share/mrustc/script-overrides"
}
