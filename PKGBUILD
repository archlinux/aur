# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=psautohint
pkgver=2.0.0
pkgrel=2
epoch=2
pkgdesc="A standalone version of AFDKO’s autohinter"
arch=('x86_64')
url="https://github.com/adobe-type-tools/psautohint"
license=('Apache')
depends=('python-lxml' 'python-fonttools')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest-cov' 'python-pytest-xdist' 'python-pytest-randomly')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('a0ce7844f6add8b2afbfb4a305072bf5dcdd85d5f0d2ad32a41f8a563b8a6d52')

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
