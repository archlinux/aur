# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=psautohint
pkgver=2.0.1
pkgrel=1
epoch=2
pkgdesc="A standalone version of AFDKO’s autohinter"
arch=('x86_64')
url="https://github.com/adobe-type-tools/psautohint"
license=('Apache')
depends=('python-lxml' 'python-fonttools' 'python-fs')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest-cov' 'python-pytest-xdist' 'python-pytest-randomly')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('43a12f3d49fc2c1d44fbd8bad64ca3391e3e44f377ce918a583dc99dbda475b5')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py test
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
