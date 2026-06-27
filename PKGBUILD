# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-mpl-typst
_pkgname=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc='Typst backend for matplotlib (Python visualization library).'
arch=('any')
url="https://github.com/daskol/$_pkgname"
license=('MIT')
groups=()
depends=('python-matplotlib' 'typst')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d3de6732903018c409ed167495a27911410eebcc6bd1cd29e3e846d2e4dccbe')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $_pkgname-$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/${_pkgname//-/_}-$pkgver-*-*.whl
}
