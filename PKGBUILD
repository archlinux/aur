# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-dm-haiku'
_pkgname=${pkgname#python-}
pkgver=0.0.12
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
optdepends=(
    'python-flax: Integration with flax'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/deepmind/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'python-dm-haiku.diff')
sha256sums=('e3de3e0e1bd779bc315e257594447e278f5cb3750691e554cd1291ab7d01b6b2'
            '8e201685fe23bb3ac20dac9e2d9ae542cbdec071a596fee80db2d522c12bb878')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i ../python-dm-haiku.diff
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
