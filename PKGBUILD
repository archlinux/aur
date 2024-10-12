# Maintainer: Kino <cybao292261@163.com>

pkgname=python-ahrs
_pkgname=ahrs
pkgver=0.3.1
pkgrel=1
pkgdesc='Attitude and Heading Reference Systems in Python'
arch=('any')
url="https://github.com/Mayitzin/ahrs"
license=('MIT')
makedepends=(
  'python-wheel'
  'python-build'
  'python-installer'
)
depends=(
  'python-numpy'
  'python-scipy'
  'python-matplotlib'
)
checkdepends=('python-pytest')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Mayitzin/ahrs/archive/v${pkgver}.tar.gz")
sha256sums=('205c5751f8db7621a11dbdc451b5ff51ec53a9b065e59153b64cf5704da3a175')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  rm tests/test_new.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH="$PWD:$PYTHONPATH" python -m pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-$_pkgname/LICENSE"
}
