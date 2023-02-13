# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-dm-haiku'
_pkgname=${pkgname#python-}
pkgver=0.0.9
pkgrel=2
pkgdesc='A library for building neural networks in JAX'
arch=('x86_64')
url='https://github.com/deepmind/dm-haiku'
license=('Apache')
depends=('python-absl'
         'python-jax'
         'python-jmp'
         'python-numpy'
         'python-typing_extensions'
         'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/deepmind/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d550f07f5891ede30ada5faafde98f549ed1b8ceadb7a601cca3d81db7d82414')

build() {
    cd "$_pkgname-$pkgver"
    python -m build -w
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        dist/${_pkgname/-/_}-$pkgver-*.whl

    # TODO(@daskol): Fix setup.py of optax.
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/build
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/docs
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/examples
}
