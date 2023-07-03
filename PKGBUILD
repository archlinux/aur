# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-triton
_pkgname=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc='Triton compiler'
arch=('x86_64')
url='https://github.com/openai/triton'
license=('MIT')
groups=('openai')
depends=()
makedepends=('cmake' 'ninja' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/openai/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('19b6de0d0bcce86e973258d112169cd321b677146808bcc5fed7f69046775cfd')

build() {
    python -m build -nw $_pkgname-$pkgver/python
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/python/dist/$_pkgname-$pkgver-*.whl
}
