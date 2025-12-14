# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatshape-git
pkgver=r217.136361c
pkgrel=1
pkgdesc='A farsi/arabic shaping preprocessor for neatroff.'
arch=(i686 x86_64)
url='http://litcave.rudi.ir/'
license=('custom:BSD')
depends=(neatroff)
makedepends=(git)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "${pkgname%-*}-hg")
replaces=('shape-git')
source=("$pkgname::git+https://github.com/aligrudi/neatroff_make")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname/shape"
	make
}

package() {
	cd "$srcdir/$pkgname/shape"
	install -D -m755 shape $pkgdir/usr/bin/neatshape
	sed '1,17!d' shape.c > LICENSE
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
