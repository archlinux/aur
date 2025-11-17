# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-blis
_pkg="${pkgname#python-}"
pkgver=1.3.3
pkgrel=1
pkgdesc='Fast matrix-multiplication as a self-contained Python library'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/cython-blis'
license=('MIT')
depends=('python-numpy' 'python-hypothesis')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/cython-blis/releases/download/release-v$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=('034d4560ff3cc43e8aa37e188451b0440e3261d989bb8a42ceee865607715ecd')

build() {
	cd "$_pkg-$pkgver"
	BLIS_ARCH="generic" python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
