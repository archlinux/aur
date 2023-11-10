# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-dm-haiku'
_pkgname=${pkgname#python-}
pkgver=0.0.11
pkgrel=1
pkgdesc='A library for building neural networks in JAX'
arch=('x86_64')
url='https://github.com/deepmind/dm-haiku'
license=('Apache')
groups=('deepmind' 'jax')
depends=('python-absl'
         'python-jax'
         'python-jmp'
         'python-numpy'
         'python-typing_extensions'
         'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/deepmind/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'python-dm-haiku.diff')
sha256sums=('dad60e2511d973cab651e8b7cb788b721b9738cda9b163d0128308b1e3cfaccf'
            '8e201685fe23bb3ac20dac9e2d9ae542cbdec071a596fee80db2d522c12bb878')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i ../patch.diff
}

build() {
    python -m build -nw "$_pkgname-$pkgver"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        dist/${_pkgname/-/_}-$pkgver-*.whl
}
