# Maintainer: El-Mundos <taber.nandez.sergio@gmail.com>
pkgname=paraninfodl
pkgver=1.4.0
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
sha256sums=('e7663f68424433ad8ba78a95a4a70261ff5ea447d14995794ad45a4f79a84f8c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 completions/paraninfodl.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/paraninfodl.fish"
    install -Dm644 completions/paraninfodl.bash \
        "$pkgdir/usr/share/bash-completion/completions/paraninfodl"
    install -Dm644 completions/_paraninfodl \
        "$pkgdir/usr/share/zsh/site-functions/_paraninfodl"
}
