# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-tueplots
_pkgname=${pkgname#python-}
pkgver=0.2.0
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
sha256sums=('ee50a6e1ed75f41487075e466b1599f33d6532eb880dd6c717e89b6f8489fca8')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build -nw $srcdir/$_pkgname-$pkgver
}

check() {
  $srcdir/$_pkgname-$pkgver
  PYTHONPATH=$PWD pytest
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    dist/$_pkgname-$pkgver-*-*.whl
}
