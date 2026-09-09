pkgname=nein
_repo=Nein
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple nano like text editor written in Python"
arch=('any')
url="https://github.com/RangS-1/nein"
license=('MIT')

depends=(
    'python'
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

sha256sums=('a23eeb66be7e5ade0f6152096fe3a791f966fce19f8f2774c3948c38b3c083a6')

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
}