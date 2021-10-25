# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-single-source
pkgver=0.2.0
pkgrel=1
pkgdesc="Python library for accessing project versions"
arch=('any')
url="https://github.com/rabbit72/single-source"
license=('MIT')
depends=('python>=3.6')
optdepends=('python-importlib-metadata>=3.0: REQUIRED for python<3.8')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('94cd39d3d7121cd63b6a2b2725f8fe1fc908ee686a2492a5f61002343162625e')

prepare() {
	cd "single-source-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "single-source-$pkgver"
	python setup.py build
}

check() {
	cd "single-source-$pkgver"
	pytest -x
}

package() {
	cd "single-source-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
