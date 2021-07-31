# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-kifield
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc="A utility for manipulating part fields in KiCad schematic files or "\
"libraries."
url="https://github.com/xesscorp/KiField"
arch=(any)
license=('MIT')
depends=(
  'python'
  'python-openpyxl'
  'python-future'
)
makedepends=('python-setuptools')
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
provides=("$pkgname")
md5sums=('312523298662438e2649d0f431a4cc6d')

build() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
