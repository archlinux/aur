# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-bcbio-gff
_name="${pkgname#python-}"
pkgver=0.6.9
pkgrel=1
pkgdesc="Library to read and write Generic Feature Format"
arch=('any')
url=https://pypi.org/project/bcbio-gff/
license=('custom:Biopython')
depends=('python-six' 'python-biopython')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('34dfa970e14f4533dc63c0a5512b7b5221e4a06449e6aaa344162ed5fdd7a1de')

build(){
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
