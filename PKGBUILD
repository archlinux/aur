# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-kivy-garden-matplotlib
_pkgname=${pkgname#python-}
_commit=f08698d1816b5574b58b96c4466cf91eefd0248e
pkgver="r60.g${_commit::7}"
pkgrel=1
pkgdesc='Matplotlib backends using kivy'
arch=('any')
url='https://github.com/kivy-garden/matplotlib'
license=('Apache')
groups=('kivy')
depends=('python-kivy' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('4f00f669a3a5b9ccd89b02dc1e9b262294dd7269a86d010f2ac86a5ba7e4835b')

prepare() {
    ln -sf "matplotlib-${_commit}" "${_pkgname}-${pkgver}"
}

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode=1 \
    --destdir=$pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/*.whl
}
