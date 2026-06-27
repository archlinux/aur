# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

pkgname=python-casacore
pkgver=3.8.1
pkgrel=1
pkgdesc="Python bindings for casacore, a radio astronomy library"
arch=(x86_64)
url="https://github.com/casacore/python-casacore"
license=(LGPL-3.0-or-later)
depends=(casacore python-numpy)
makedepends=(python-build python-installer python-scikit-build-core python-setuptools-scm python-wheel boost)
provides=(python-pyrap)
replaces=(python-pyrap)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('279d4062725a8d186e4347735f3583c988bf3f82c4bbe3e90bd8f4ec620097025a5e8c120a55bc66d7ddcd982d948c5819ed4868e3c7a9dc360a59496534931b')

build() {
    cd "$pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
