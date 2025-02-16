# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wadler-lindig
_pkgname=wadler_lindig
pkgver=0.1.3
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
sha256sums=('ebf4fcf0d687b91f959c804b8f1eef23b6bbbfe5aa7b1efa18fad888b13475a8')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $srcdir/$_pkgname-$pkgver/
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*-*.whl
}
