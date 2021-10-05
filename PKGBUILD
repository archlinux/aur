# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-daft
pkgver=0.1.2
pkgrel=1
pkgdesc="Render probabilistic graphical models using matplotlib"
arch=('any')
url='https://github.com/daft-dev/daft'
license=('MIT')
depends=('python-numpy' 'python-matplotlib')
makedepends=(
	'python-setuptools'
	'python-setuptools-scm'
	# 'python-sphinx'
	# 'python-myst-nb'
)
# checkdepends=('python-pytest-runner')
changelog=HISTORY.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/daft/daft-$pkgver.tar.gz")
sha256sums=('3e77e0389ca539a5741a906bcdcaae462b68261d06b960b0c04498b695d312e5')

build() {
	cd "daft-$pkgver"
	python setup.py build
}

## tests fail with Arch's python-matplotlib
# check() {
# 	cd "daft-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "daft-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname/"
}
