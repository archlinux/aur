# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-jaxtyping
_pkgname=${pkgname#python-}
pkgver=0.2.38
pkgrel=1
pkgdesc='Type annotations and runtime checking for shape and dtype of JAX arrays, and PyTrees.'
arch=('any')
url="https://github.com/patrick-kidger/jaxtyping"
license=('Apache-2.0')
groups=('jax')
depends=('python-wadler-lindig')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
optdepends=('python-jax: Original JAX type system support.'
            'python-pytest: Extension for pytest with jaxtyping plugin.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a8b7a438b2caad5aac0e5fd83e63f4672a03e4737471bd43215eabca05926229')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    cd $srcdir/$_pkgname-$pkgver/
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*.whl
}
