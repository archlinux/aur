# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-pyaml
pkgver=21.8.3
pkgrel=1
pkgdesc="PyYAML-based module to produce pretty and readable YAML-serialized data"
url="https://pypi.python.org/pypi/pyaml"
license=('custom:WTFPL')
arch=('any')
depends=('python2-yaml')
makedepends=('python2-setuptools')
# checkdepends=('python2-unidecode')
optdepends=('python2-unidecode: Needed if same-id objects or recursion is used within serialized data')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyaml/pyaml-$pkgver.tar.gz")
sha512sums=('69b1181511f7d3ac1263b710fa49b18a162e096e28414d83300bc2e9038222363cef995a0d3248387560e7066973736f9cee06b67042ee957427b4790c269653')

build() {
	cd "pyaml-$pkgver"
	python2 setup.py build
}

## Deprecated and doesn't actually return any meaningful test results
# check() {
#		cd "$srcdir"/pyaml-$pkgver
#		python2 setup.py test
# }

package() {
	cd "pyaml-$pkgver"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
