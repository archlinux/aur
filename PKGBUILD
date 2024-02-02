# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=PuLP
pkgname=python-pulp
pkgver=2.8.0
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("BSD")
url="https://github.com/coin-or/pulp"
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('4d4af731c75ff8bad878b09e9a9b90c6e482107cf14f65bf3a35ddf7b224985fa48139984c9cc35ca12d1f4f98e391486229140ec6eee04fb94428576519a212')

prepare() {
	rm -fr python-pulp
	cp -r $_pkgname-$pkgver python-pulp
}

build() {
	cd python-pulp
	python setup.py build
}

package() {
	cd python-pulp

	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build

	install --directory "$pkgdir"/usr/share/licenses/$pkgname/
	install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
