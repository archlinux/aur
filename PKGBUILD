# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-jaxtyping
_pkgname=${pkgname#python-}
pkgver=0.2.33
pkgrel=1
pkgdesc='Type annotations and runtime checking for shape and dtype of JAX arrays, and PyTrees.'
arch=('any')
url="https://github.com/google/jaxtyping"
license=('Apache')
groups=('jax')
depends=('python-typeguard')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
optdepends=('python-jax: Original JAX type system support.'
            'python-pytest: Extension for pytest with jaxtyping plugin.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe889e9bd86f1f79cc14a4690d834f8afd3fc4beb39a232d3bab93950727fb7f')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
