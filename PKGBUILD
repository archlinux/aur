# Maintainer: Kino <cybao292261@163.com>

pkgname=python-objprint
_pkgname=objprint
pkgver=0.2.3
pkgrel=4
pkgdesc='A library that can print Python objects in human readable format.'
arch=('x86_64')
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
sha256sums=('fc4defba274c3c9ff91eb71623417f490ed68f54aa04c9ca04f1df021b177f3d')

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
