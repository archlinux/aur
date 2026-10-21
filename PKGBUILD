# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybigwig
_name=pyBigWig
pkgver=0.3.28
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=(x86_64)
url=https://github.com/deeptools/pyBigWig
license=('MIT')
depends=(curl python-numpy zlib)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm)
options=(!emptydirs)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('7133f728f4f13f5767c9798180470cf43f77859f113b58cbb0421ac9039e10a5')

prepare() {
    cd "$_name-$pkgver"
    # Upstream left the Python distribution metadata at 0.3.26.
    sed -i "s/^version = .*/version = \"$pkgver\"/" pyproject.toml
}

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
