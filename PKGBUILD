# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-protes
_pkgname=${pkgname#python-}
_pkghash=421029b501fdebe87bf35521cdfad95f921bf108
pkgver=0.2.3
pkgrel=1
pkgdesc='Probability optimizer with tensor sampling'
arch=('any')
url='https://github.com/anabatsh/protes'
license=('MIT')
depends=('python-jax' 'python-optax')
makedepends=('python-build' 'python-installer')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$_pkghash.zip")
sha256sums=('7099db4d9bcbe6f0ca20fe510e7fdee078cb8c17f15680c175c1da5ee016f78f')

prepare() {
    mv PROTES-$_pkghash $_pkgname-$pkgver
}

build() {
    cd $_pkgname-$pkgver
    python -m build -n -w
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
