# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: SteamedFish <steamedfish@hotmail.com>

pkgname=python-aiocron
pkgver=2.1
pkgrel=1
pkgdesc="Provide a decorator to run function at time"
arch=('any')
url="https://github.com/gawel/aiocron"
license=('MIT')
changelog=CHANGES.rst
depends=('python-tzlocal' 'python-croniter' 'python-cronsim' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/aiocron/aiocron-$pkgver.tar.gz")
sha256sums=('1bb65a36aee137e8833592783956e0c7dc478bc3e9273fc2841d5d0c6045e4d2')

build() {
	cd "aiocron-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "aiocron-$pkgver"
	pytest
}

package() {
	cd "aiocron-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
