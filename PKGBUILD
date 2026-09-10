pkgname=tcpchat
_repo=TCPChat
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple implementation of a TCP chat application using Python's socket and threading modules."
arch=('any')
url="https://github.com/RangS-1/TCPChat"
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

sha256sums=('5b7c24eacbc4cef42ec85d215f5248e15050fa6985b630e47d80fefaafd40bdf')

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