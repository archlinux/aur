# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wadler-lindig
_pkgname=wadler_lindig
pkgver=0.1.6
pkgrel=1
pkgdesc='A Wadler–Lindig pretty-printer for Python.'
arch=('any')
url='https://github.com/patrick-kidger/wadler_lindig'
license=('Apache-2.0')
groups=()
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer'
             'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e741f738e7ec6b58cd105798382d3c95124e6c280bbc1ddec25acaa75de3e27')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $srcdir/$_pkgname-$pkgver/
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*-*.whl
}
