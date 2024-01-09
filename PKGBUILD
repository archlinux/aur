# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-debianbts
pkgver=4.0.2
pkgrel=1
pkgdesc="Python library for querying Debian's Bug Tracking System"
arch=('any')
url="https://github.com/venthur/python-debianbts"
license=('MIT')
depends=('python' 'python-pysimplesoap')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-xdist')
source=("https://github.com/venthur/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('19613df0e4685f7af37e377a952d375034596b819f26eaef1275e454a29ba700')

build() {
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd $pkgname-$pkgver
	pytest
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
