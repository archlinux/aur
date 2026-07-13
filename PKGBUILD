# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_name=odsexport
pkgname=python-"$_name"
pkgver=0.0.5
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
       "$url/commit/ccc8abb9e532179a9642f365bb7dbbc13fa42e78.patch")
sha256sums=('3462d58cf025d28f8cc8548145c2de7a99118aa3022195e52b98cd85b32d6042'
            '59587bfb675edafc472d10ffe880e32319c8fb89cbd19aca6044b1f643faaf44')

prepare() {
    cd "$_name-$pkgver"
    patch -p1 -i "$srcdir"/ccc8abb9e532179a9642f365bb7dbbc13fa42e78.patch
}

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
