# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_name=odsexport
pkgname=python-"$_name"
pkgver=0.0.4
pkgrel=1
pkgdesc='Python-native library to create ODS (Open Document Spreadsheet) documents'
arch=(any)
url="https://github.com/johndoe31415/$_name"
license=(GPL-3.0-only)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-setuptools
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3ff6ebe53a2c1e511d54bae6d55929fea418f9c9f91328b71871ce4fcde66c0')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -t "$pkgdir/usr/share/doc/$pkgname" -Dm755 example/write_example_document.py
    install -t "$pkgdir/usr/share/doc/$pkgname" -Dm644 example/example_document.ods
}
