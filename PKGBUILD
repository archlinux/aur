# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-blis
_pkg="${pkgname#python-}"
pkgver=1.0.2
pkgrel=1
pkgdesc='Fast matrix-multiplication as a self-contained Python library'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/cython-blis'
license=('MIT')
depends=('python-numpy>=2.0')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/cython-blis/releases/download/release-v$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=('68df878871a9db34efd58f648e12e06806e381991bd9e70df198c33d7b259383')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
