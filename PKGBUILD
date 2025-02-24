# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=python-debianbts
pkgver=4.1.1
pkgrel=3
pkgdesc="Python library for querying Debian's Bug Tracking System"
arch=('any')
url="https://github.com/venthur/python-debianbts"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-xdist')
source=("https://github.com/venthur/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('208d77775a6aa522afe507e16784c10fc56342b7eb2f118cc0c04efde12c1041')

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
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
