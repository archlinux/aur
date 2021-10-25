# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-crimson
pkgver=1.0.0
pkgrel=1
pkgdesc="Bioinformatics tool outputs converter to JSON or YAML"
arch=('any')
url='https://git.sr.ht/~bow/crimson'
license=('BSD')
depends=(
	'python>=3.7'
	'python-click>=7.0'
	'python-yaml>=5.2'
	'python-single-source>=0.2.0')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('65859b0d55bf632b227a536505bca43f419f114636e824e25f86473075c1a766')

prepare() {
	cd "crimson-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "crimson-$pkgver"
	python setup.py build
}

check() {
	cd "crimson-$pkgver"
	pytest -x
}

package() {
	cd "crimson-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
