# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-mpl-typst
_pkgname=${pkgname#python-}
pkgver=0.2.1
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
sha256sums=('b6b0dc2975c7138462346eb5b0338d5977548591e2245e1ab36b74440d4d17b8')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $_pkgname-$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/${_pkgname//-/_}-$pkgver-*-*.whl
}
