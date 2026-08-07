pkgname=ferminal
_repo=Ferminal
pkgver=1.4.0
pkgrel=1
pkgdesc="Custom Wrapper CLI to make your work faster"
arch=('any')
url="https://github.com/RangS-1/ferminal"
license=('MIT')

depends=(
    'python'
    'python-colorama'
    'python-prompt_toolkit'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/RangS-1/${_repo}/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('4d1242491a8bc47fd28e61a7b69fa0a9703a467f2e7f0b313b22865438aa8a5e')

build() {
    cd "$srcdir/${_repo}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_repo}-${pkgver}"

    python -m installer \
        --destdir="$pkgdir" \
        dist/*.whl

    install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    sudo install -Dm644 docs/ferminal.1 \
    /usr/share/man/man1/ferminal.1

    sudo gzip /usr/share/man/man1/ferminal.1
}