# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-cohesion
pkgver=1.0.0
pkgrel=3
pkgdesc='Measures Python class cohesion'
arch=('any')
url="https://github.com/mschwager/cohesion"
license=('GPL3')
depends=('python')
optdepends=('flake8')
makedepends=('python-setuptools')
checkdepends=(
	'python-nose2>=0.6.5'
	'python-pytest-cov'
	'python-coveralls>=1.1' ## AUR
	'python-pyfakefs>=2.7')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('abb5a88b70de96e7dfb65244cc13cff7e9c5edee5333175d5a7668ac7c742c6c')

build() {
	cd "cohesion-$pkgver"
	python setup.py build
}

check() {
	cd "cohesion-$pkgver"
	nose2
}

package() {
	cd "cohesion-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
