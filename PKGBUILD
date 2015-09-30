# Maintainer: TingPing <tingping@tingping.se>

pkgbase=brotli
pkgname=('brotli' 'python-brotli' 'python2-brotli')
pkgver=0.2.0
pkgrel=2
pkgdesc='Python compression library'
arch=('i686' 'x86_64')
license=('Apache')
url='https://github.com/google/brotli'
makedepends=('python' 'python2')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/google/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('634d1089ee21b35e0ec5066cb5e44dd097e04e679e1e8c50bffa2b0dc77c2c29')

build() {
	cd "$pkgbase-$pkgver"

	msg 'Building Python 3...'
	python ./setup.py build_ext

	msg 'Building Python 2...'
	python2 ./setup.py build_ext

	msg 'Building bro...'
	cd tools && make
}

check() {
	cd "$pkgbase-$pkgver"

	msg 'Testing Python 3...'
	python ./setup.py test

	msg 'Testing Python 2...'
	python2 ./setup.py test
}

package_brotli() {
	cd "$pkgbase-$pkgver/tools"

	install -Dm755 bro "$pkgdir/usr/bin/bro"
}

package_python-brotli() {
	depends=('python')

	cd "$pkgbase-$pkgver"

	python ./setup.py install --skip-build --root="$pkgdir/"
}

package_python2-brotli() {
	depends=('python2')

	cd "$pkgbase-$pkgver"

	python2 ./setup.py install --skip-build --root="$pkgdir/"
}
