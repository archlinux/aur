# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-codetiming
pkgver=1.3.0
pkgrel=1
pkgdesc="A flexible, customizable timer for your Python code"
license=('MIT')
arch=('any')
url='https://github.com/realpython/codetiming'
depends=('python>=3.6')
makedepends=('python-setuptools' 'python-flit-core' 'python-dephell')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/codetiming/codetiming-$pkgver.tar.gz")
sha256sums=('7f9949dad6438f458a22b811b0738c55e45f685d27551352871e15811f3a5e89')

prepare() {
	cd "codetiming-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "codetiming-$pkgver"
	python setup.py build
}

check() {
	cd "codetiming-$pkgver"
	python setup.py pytest
}

package() {
	cd "codetiming-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --skip-build --root="$pkgdir/" --optimize=1
	install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -D README.md AUTHORS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
