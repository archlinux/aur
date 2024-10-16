# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-dm-haiku'
_pkgname=${pkgname#python-}
pkgver=0.0.13
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
sha256sums=('5306ce774c358f3910c6f522cc62fe51d95677f04b608972bcffade907bae748'
            'SKIP')

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
