# Maintainer: Your Name <youremail@example.com>
pkgname=nassemble
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple tool to aggregate code and documentation into a single text file."
arch=('any')
url="https://pypi.org/project/nassemble/"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
# This line pulls the source code directly from PyPI
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/n/nassemble/nassemble-$pkgver.tar.gz")
# We use 'SKIP' here so we can generate the checksum automatically
sha256sums=('cd725a7b9868b48392f1e6a3c1b7f5214f6d2c0343fa152c8eb37c45009a5216')

build() {
    cd "$pkgname-$pkgver"
    # This builds the standard wheel (.whl) file
    python -m build --wheel --no-isolation
}

check() {
    # (Optional, but good practice if you have a test suite)
    # cd "$pkgname-$pkgver"
    # pytest
    :
}

package() {
    cd "$pkgname-$pkgver"

    # This installs the built wheel into the package directory
    python -m installer --destdir="$pkgdir" dist/*.whl

    # This installs your LICENSE file
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
