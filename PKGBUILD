# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybigwig
_name=pyBigWig
pkgver=0.3.24
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=(any)
url=https://github.com/deeptools/pyBigWig
license=('MIT')
depends=(curl python-numpy)
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('4d1a78833c90c1bc5630103f1d2fd8ef68db4b620ab729b07b7c515771f23522')

build() {
    cd "$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
