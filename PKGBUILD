# Maintainer: palsage meajitsheoran@gmail.com
pkgname=cellpose
pkgver=3.0.11
pkgrel=1
pkgdesc="Cellpose: a generalist algorithm for cellular segmentation with GUI support"
arch=('any')
url="https://www.cellpose.org/"
license=('BSD')
depends=(
    'python'
    'python-pip'
)
makedepends=()
optdepends=('python-matplotlib: for plotting support')
source=("https://files.pythonhosted.org/packages/64/25/566e0ec2f42fa6be7ec4225ee3b71670d31471ce1381ae5bffdd318b24dc/cellpose-$pkgver.tar.gz")
sha256sums=('a8d902e7fe76fe0319871ac9426dd8d1d3d526f014d51c070918762939ce40db') # checksum of the tarball

prepare() {
    cd "$srcdir/cellpose-$pkgver"

    # Upgrade pip and install build dependencies
    pip install --upgrade pip
}

build() {
    cd "$srcdir/cellpose-$pkgver"
    pip install .[gui]
}

package() {
    cd "$srcdir/cellpose-$pkgver"
    pip install --root="$pkgdir/" --no-deps .[gui]

    rm -rf "$pkgdir/usr/share/doc/"
    rm -rf "$pkgdir/usr/share/man/"
    rm -rf "$pkgdir/usr/lib/python*/site-packages/*/tests/"
    rm -rf "$pkgdir/usr/lib/python*/site-packages/cellpose/data/"
}

# install -Dm644 "$srcdir/cellpose-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
