pkgname=ferminal
_repo=Ferminal
pkgver=1.4.1
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

sha256sums=('956e92512b0673fa68524752e2e79e3d5b57d44d6007fc7a9113f8ebcd926f6c')

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