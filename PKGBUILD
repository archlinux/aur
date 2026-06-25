# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

pkgname=python-casacore
pkgver=3.7.1
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
sha512sums=('d75972907abfe2f0fa0c6c321a40b0153c208af8f8c88a5ad7eb677d4e7d66493d70e87374046dca46710ef75ec07c1eddd29f4e51fcf1689137c201fc993625')

build() {
    cd "$pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
