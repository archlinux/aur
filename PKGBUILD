# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jmp'
_pkgname=${pkgname#python-}
pkgver=0.0.4
pkgrel=3
pkgdesc='A mixed precision library for JAX'
arch=('x86_64')
url='https://github.com/deepmind/jmp'
license=('Apache')
group=('deepmind' 'jax')
depends=('python-jax' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/deepmind/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('830a802144e66d27a3acb54d203efcf47067f7c5f4b6312d29d3b65a89a4cba1')

build() {
    python -m build -nw "$_pkgname-$pkgver"
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/${_pkgname/-/_}-$pkgver-*.whl

    # TODO(@daskol): Fix setup.py of optax.
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/build
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/docs
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/examples
}
