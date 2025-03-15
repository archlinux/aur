# Maintainer: Kino <cybao292261@163.com>

pkgname=python-objprint
_pkgname=objprint
pkgver=0.3.0
pkgrel=2
pkgdesc='A library that can print Python objects in human readable format.'
arch=('any')
url="https://github.com/gaogaotiantian/objprint"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-wheel'
  'python-build'
  'python-installer'
)
checkdepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gaogaotiantian/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5d7e7fefb9f562bbfaa2585f83b58da1c0ffd3a8d9534dcbd3ccb6ab956424ab')

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit

  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname-$pkgver" || exit

  PYTHONPATH="$PWD/src:$PYTHONPATH" python -m unittest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-$_pkgname/LICENSE"
}
