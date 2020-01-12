# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Phil Schaf <flying-sheep@web.de>

_pkgname=rst2pdf
pkgname=python-rst2pdf
pkgver=0.96
pkgrel=1
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/$_pkgname/$_pkgname"
license=('MIT')
conflicts=(python2-rst2pdf)
depends=('python-setuptools' 'python-docutils' 'python-reportlab>=2.4' 'python-pygments' 'python-pdfrw')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('17165941972ed55f7b969499e3cd076b')


prepare() {
	cd "$_pkgname-$pkgver"
	# master runs on python3, so this can be nuked in the near future
	2to3 -w .
}

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
