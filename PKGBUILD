# Maintainer: Johannes Dewender  arch at JonnyJD dot net
pkgname=coverity-submit
pkgver=1.9
pkgrel=1
pkgdesc="Submitting Coverity builds"
arch=('any')
url="http://www.catb.org/esr/coverity-submit/"
license=('BSD')
depends=('python2' 'curl' 'cov-analysis')
makedepends=('pychecker')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('aa532ef202fad33a80eaa50feda8a4a7')

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
