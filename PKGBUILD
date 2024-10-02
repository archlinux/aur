# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatcell-git
pkgver=r20.1954258
pkgrel=1
pkgdesc='A small Linux sandbox'
arch=('i686' 'x86_64')
url='https://github.com/aligrudi/cell'
license=('ISC')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's@/path/to/cell/cell@/usr/bin/neatcell@g' cell.sh
	sed -i 's/cell\.sh/neat&/g' README
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 cell $pkgdir/usr/bin/neatcell
	install -D -m644 cell.sh $pkgdir/usr/share/doc/${pkgname%-*}/neatcell.sh
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
