# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-jaxtyping
_pkgname=${pkgname#python-}
pkgver=0.2.12
pkgrel=1
pkgdesc='Type annotations and runtime checking for shape and dtype of JAX arrays, and PyTrees.'
arch=('any')
url="https://github.com/google/jaxtyping"
license=('Apache')
groups=('jax')
depends=(
    'python-numpy'
    'python-typeguard'
    'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=('python-jax: Original JAX type system support.'
            'python-pytest: Extension for pytest with jaxtyping plugin.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e8686182078974a60101a41f88005bc2a0f3c4080369759ea82bb314d050f7a')

build() {
    python -m build -n -w $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
