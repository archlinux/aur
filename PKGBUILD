# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-torchpippy
_pkgname=PiPPy
pkgver=0.2.0
pkgrel=1
pkgdesc='Pipeline Parallelism for PyTorch.'
arch=('any')
url='https://github.com/pytorch/pippy'
license=('Apache')
groups=()
depends=('python-packaging' 'python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4604fe4816310b75e81e3bb5c95500743cd7242cbaf03ff486857c4379c063b6')

prepare() {
   rm -rfv $srcdir/$_pkgname-$pkgver/test
}

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/${pkgname#python-}-$pkgver-*-*.whl
}
