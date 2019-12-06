# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=psautohint
pkgver=2.0.0
pkgrel=1
epoch=2
pkgdesc="A standalone version of AFDKO’s autohinter"
arch=('x86_64')
url="https://github.com/adobe-type-tools/psautohint"
license=('Apache')
depends=('python-lxml' 'python-fonttools')
makedepends=('git' 'python-setuptools-scm')
checkdepends=('python-pytest-cov' 'python-pytest-xdist' 'python-pytest-randomly')
source=("git+https://github.com/adobe-type-tools/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

check() {
	cd "$srcdir/$pkgname"
	python setup.py test
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
