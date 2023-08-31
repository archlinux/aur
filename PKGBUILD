# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-debianbts
pkgver=4.0.1
pkgrel=1
pkgdesc="Python library for querying Debian's Bug Tracking System"
arch=('any')
url="https://github.com/venthur/python-debianbts"
license=('MIT')
depends=('python' 'python-pysimplesoap')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-xdist')
source=("https://github.com/venthur/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9cf0b78038e4135afb3b7a3cb9eb2d3ca76c74e8fd26756dda6c1e943cf77faa')

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
