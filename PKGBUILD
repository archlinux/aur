# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hugo Rodrigues <me@hugorodrigues.net>

pkgname=python-odoorpc
_name=OdooRPC
pkgver=0.9.0
pkgrel=1
pkgdesc='Python module providing an easy way to pilot your Odoo servers through RPC.'
arch=('any')
url='https://github.com/OCA/odoorpc'
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('936adc52871b4c9d6b921c73421acd88f73442b17a71a49f34de6dbcf54d7964')

build() {
	cd "$_name-$pkgver"
	python setup.py build

	cd doc
	PYTHONPATH=../ make man
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 doc/build/man/odoorpc.1 -t "$pkgdir/usr/share/man/man1/"
}
