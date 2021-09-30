# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-pygeno
pkgver=2.0.0
pkgrel=1
pkgdesc='Personalized genomics and proteomics'
arch=('any')
url="https://github.com/tariqdaouda/pygeno"
license=('Apache')
depends=('python-rabadb')
makedepends=('python-setuptools')
changelog=
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyGeno/pyGeno-$pkgver.tar.gz")
sha256sums=('0f8818d911c543f9d5df7056799640f3bc64e05a6a8dedecc7f322ce1ec95560')

prepare() {
	cd "pyGeno-$pkgver"
	sed -i '/sample=sample/s/sample/pygeno-sample/' setup.py
}

build() {
	cd "pyGeno-$pkgver"
	python setup.py build
}

check() {
	cd "pyGeno-$pkgver"
	python setup.py test
}

package() {
	cd "pyGeno-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
