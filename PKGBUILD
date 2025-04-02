# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-protes
_pkgname=${pkgname#python-}
_pkghash=b99c2a6a554b0b1b423f3f459d2b129c996a8ede
pkgver=0.3.11
pkgrel=1
pkgdesc='Probability optimizer with tensor sampling'
arch=('any')
url='https://github.com/anabatsh/protes'
license=('MIT')
depends=('python-jax' 'python-matplotlib' 'python-optax')
makedepends=('python-build' 'python-installer')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$_pkghash.zip")
sha256sums=('fe01c55e65ad33fea80b8b901bab66b42d34748793fe4c64e4cd7c13ab90e6f0')

prepare() {
    ln -sf PROTES-$_pkghash $_pkgname-$pkgver
}

build() {
    cd $_pkgname-$pkgver
    python -m build -n -w
}

check() {
    cd $_pkgname-$pkgver
    PYTHONPATH=$PWD python -c 'import protes'
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
