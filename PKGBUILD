pkgname=nein
_repo=Nein
pkgver=1.1.0
pkgrel=2
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

sha256sums=('39ff4eea06300f291413385a03c8c1b2cb2bd80360554c69ef2e7950e942c885')

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
