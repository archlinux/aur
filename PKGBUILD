# Maintainer: El-Mundos <taber.nandez.sergio@gmail.com>
pkgname=paraninfodl
pkgver=1.3.0
pkgrel=1
pkgdesc="Download ebooks from ebooks.paraninfo.es as PDF"
arch=('any')
url="https://github.com/El-Mundos/paraninfodl"
license=('MIT')
depends=(
    'python'
    'python-playwright'
    'python-cryptography'
    'python-pypdf'
    'python-reportlab'
    'python-pillow'
    'python-requests'
    'img2pdf'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/El-Mundos/paraninfodl/archive/v$pkgver.tar.gz")
sha256sums=('cf64b537fa66b9ab44a446da99da95f163f3ba92dc9b6e855f5a61c5902b41e0')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 completions/paraninfodl.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/paraninfodl.fish"
}
