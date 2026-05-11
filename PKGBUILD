# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-mpl-typst
_pkgname=${pkgname#python-}
pkgver=0.3.0
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
sha256sums=('c3cfaa63a0975958e1496b653d91575fe11927e61fd687470ca071572b59a6f3')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $_pkgname-$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/${_pkgname//-/_}-$pkgver-*-*.whl
}
