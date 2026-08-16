pkgname=ferminal
_repo=Ferminal
pkgver=1.4.2
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

sha256sums=('4940ca67416bbf8b63d8204fcecb540a4355fadd557d250df96ea464f92bb3ce')

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