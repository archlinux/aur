# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-tueplots
_pkgname=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc='Extend matplotlib for scientific publications'
arch=('any')
url='https://github.com/pnkraemer/tueplots'
license=('MIT')
groups=()
depends=('python-matplotlib' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cases')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24cd47f57dd414f6fc0f3f7169b5ff45cfbcb81fc3feabc1c17648420b88dbca')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build -nw $srcdir/$_pkgname-$pkgver
}

check() {
  $srcdir/$_pkgname-$pkgver
  PYTHONPATH=$PWD pytest
}

package() {
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
