# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybigwig
_name=pyBigWig
pkgver=0.3.29
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=(x86_64)
url=https://github.com/deeptools/pyBigWig
license=('MIT')
depends=(curl python-numpy zlib)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm)
options=(!emptydirs)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('17742ec653cc5acba9132afb958a4fc2446f1ae18d236d906b1a5cc2339e91a1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 libBigWig/LICENSE "$pkgdir/usr/share/licenses/$pkgname/libBigWig.LICENSE"
}
