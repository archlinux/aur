# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-pyaml
pkgver=21.10.1
pkgrel=1
pkgdesc="PyYAML-based module to produce pretty and readable YAML-serialized data"
url="https://pypi.python.org/pypi/pyaml"
license=('custom:WTFPL')
arch=('any')
depends=('python2-yaml')
makedepends=('python2-setuptools' 'python-docutils')
checkdepends=('python2-unidecode')
optdepends=('python2-unidecode: Needed if same-id objects or recursion is used within serialized data')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyaml/pyaml-$pkgver.tar.gz")
sha512sums=('3a98a021856446584f079bfb7427c63feaf6fdd1bd0d809d46aa0c646b2cb9533c393ed0167240be587aad7b94209b6e5bfe2c09918b45ec9a86ad9781bdf9f2')

build() {
	cd "pyaml-$pkgver"
	python2 setup.py build
	rst2man README.rst pyaml.1
}

check() {
	cd "pyaml-$pkgver"
	python2 -m unittest discover
}

package() {
	cd "pyaml-$pkgver"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 pyaml.1 -t "$pkgdir/usr/share/man/man1/"
}
