# Maintainer: RangS <rangga19sj@gmail.com>
pkgname=ferminal
_repo=Ferminal
pkgver=1.4.4
pkgrel=2
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

sha256sums=('54bfc5e06f40a1a3b8191821c3e1fc129a714fc78eaa5dcc84259f898fa657ab')

build() {
    cd "$srcdir/${_repo}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_repo}-${pkgver}"

    python -m installer \
        --destdir="$pkgdir" \
	--compile-bytecode=2 \
        dist/*.whl

    install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 docs/ferminal.1 "$pkgdir/usr/share/man/man1/ferminal.1"
}
