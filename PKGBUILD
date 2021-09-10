# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=python-aiocron
pkgver=1.7
pkgrel=1
pkgdesc="Provide a decorator to run function at time"
arch=('any')
url="https://github.com/gawel/aiocron"
license=('MIT')
changelog=CHANGES.rst
depends=('python-tzlocal' 'python-croniter')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/aiocron/aiocron-$pkgver.tar.gz")
sha256sums=('ad7d3b9bd88897934ffd18937ff235ab9fb01358280fd40e01461fd5f76348bd')

build() {
	cd "aiocron-$pkgver"
	python setup.py build
}

check() {
	cd "aiocron-$pkgver"
	python setup.py pytest
}

package() {
	cd "aiocron-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
