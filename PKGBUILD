# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatpost-git
pkgver=r131.4a371a4
pkgrel=1
pkgdesc="Neatroff's postscript postprocessor"
arch=('i686' 'x86_64')
url='http://litcave.rudi.ir/'
license=('ISC')
depends=('neatroff-git')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/aligrudi/neatpost")
md5sums=('SKIP')

## FONTS directory
FDIR=/usr/share/neatroff/font

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make all FDIR=$FDIR
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 post $pkgdir/usr/bin/neatpost
	install -D -m755 pdf $pkgdir/usr/bin/neatpdf
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
