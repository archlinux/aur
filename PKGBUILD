# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-mpi4jax
_pkgname=${pkgname#python-}
pkgver=0.3.15
pkgrel=1
pkgdesc='Zero-copy MPI communication of JAX arrays, for turbo-charged HPC applications in Python.'
arch=('any')
url='https://github.com/mpi4jax/mpi4jax'
license=('Apache')
groups=()
depends=('python-jax' 'python-mpi4py')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec6e4a7db7684d42db1a5430a84f27f03f4ee3e5113825102a666ab3b1f5a377')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
