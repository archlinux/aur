# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: SteamedFish <steamedfish@hotmail.com>

pkgname=python-aiocron
pkgver=1.8
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
sha256sums=('48546513faf2eb7901e65a64eba7b653c80106ed00ed9ca3419c3d10b6555a01')

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
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
