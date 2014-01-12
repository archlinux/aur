# Maintainer: Johannes Dewender  arch at JonnyJD dot net
pkgname=coverity-submit
pkgver=1.12
pkgrel=1
pkgdesc="Submitting Coverity builds"
arch=('any')
url="http://www.catb.org/esr/coverity-submit/"
license=('BSD')
depends=('python2' 'curl')
makedepends=('pychecker')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6b2c61a809bef8f83b4b90c6eaff4ef0')

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
