# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=jadart
pkgver=1.1.0
pkgrel=1
pkgdesc="Decompiler for Flutter and Dart AOT snapshots. Recovers the class tree, method bodies, strings and const tables from a stripped libapp.so"
arch=('any')
url="https://github.com/IR0NBYTE/Jadart"
license=('MIT')
depends=('python' 'python-capstone')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/IR0NBYTE/Jadart/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb83c063178413d2536b16d0a842454f6d7abc58ba5224dfc276e7502dee5c32')

latestver() {
    curl -fsSL "https://api.github.com/repos/IR0NBYTE/Jadart/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

build() {
    cd "$srcdir/Jadart-${pkgver}/framework"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Jadart-${pkgver}/framework"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/Jadart-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
