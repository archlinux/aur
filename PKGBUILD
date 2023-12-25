# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-kifield
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="A utility for manipulating part fields in KiCad schematic files or "\
"libraries."
url="https://github.com/devbisme/KiField"
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
md5sums=('56d5bf271d2674ed22aa0fa3544a5dda')

build() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
