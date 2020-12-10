# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-pystatparser-git
pkgver=r24.0e4990d
pkgrel=4
pkgdesc="Simple Python statistical (CKY) parser"
url="https://github.com/emilmont/pyStatParser"
arch=('any')
provides=('python-pystatparser')
depends=('python' 'python-nltk')
makedepends=('git' 'python-setuptools')
_name='pyStatParser'
source=("git+https://github.com/emilmont/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  printf "%s" $_gitversion
}

build() {
  cd "$_name"
  python setup.py build
}

package() {
  cd "$_name"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  cd "$pkgdir/usr/lib/python"*"/site-packages/"
  PYTHONPATH=$PYTHONPATH:$(pwd) python -c 'import stat_parser; stat_parser.Parser()'
}
