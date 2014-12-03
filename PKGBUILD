# Maintainer: Johannes Dewender  arch at JonnyJD dot net
pkgname=coverity-submit
pkgver=1.13
pkgrel=1
pkgdesc="Submitting Coverity builds"
arch=('any')
url="http://www.catb.org/esr/coverity-submit/"
license=('BSD')
depends=('python2' 'curl')
makedepends=('pychecker')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('afc40b86f9911617b5c309d3330a65c8')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e "s|/usr/bin/env python|/usr/bin/env python2|" coverity-submit
	# make build builds the man page, which doesn't work for unknown reasons
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make pychecker
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D coverity-submit $pkgdir/usr/bin/coverity-submit
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
