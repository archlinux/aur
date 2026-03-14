# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybigwig
_name=pyBigWig
pkgver=0.3.25
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=(any)
url=https://github.com/deeptools/pyBigWig
license=('MIT')
depends=(curl python-numpy)
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('6343f2f10a4ecc3deedba3d1c345ac33191dbd3ab69f80b4dfc1a869dae81176')

build() {
    cd "$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
