# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybigwig
_name=pyBigWig
pkgver=0.3.26
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=(x86_64)
url=https://github.com/deeptools/pyBigWig
license=('MIT')
depends=(curl python-numpy zlib)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm)
options=(!emptydirs)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('057a8b260ef78399cfcee0516e1c17a4a68e52d7865566b7859485de39269ed3')

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
