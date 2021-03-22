# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-kifield
_name=${pkgname#python-}
pkgver=0.1.16
pkgrel=1
pkgdesc="A utility for manipulating part fields in KiCad schematic files or "\
"libraries."
url="https://xess.com/KiField/docs/_build/singlehtml/index.html"
arch=(any)
license=('BSD')
depends=(
  'python'
  'python-openpyxl'
  'python-future'
)
makedepends=('python-setuptools')
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
provides=('python-kifield')
md5sums=('f2b1cfbeef2b714fcb98a7194fd45e91')

build() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
