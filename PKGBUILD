# Maintainer: RangS <rangga19sj@gmail.com>
pkgname=linkchanger
_repo=LinkChanger
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple tool to change old domain URLs to new domain URLs in your website files."
arch=('any')
url="https://github.com/RangS-1/LinkChanger"
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

sha256sums=('89054b4f35560b90235d903ef10070e3cee10304326b2d68a04767dadedbafef')

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

}
