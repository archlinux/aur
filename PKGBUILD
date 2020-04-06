# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=pyportfolioopt
_PkgName=PyPortfolioOpt
pkgname=python-$_pkgname-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Financial portfolio optimisation in python"
arch=('any')
url="https://github.com/robertmartin8/PyPortfolioOpt"
license=('MIT')
depends=('python-pandas' 'python-cvxpy')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/robertmartin8/PyPortfolioOpt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_PkgName"
  grep 'version' setup.py | awk -F'"' '{print $2}'
}

build() {
  cd "$srcdir/$_PkgName"
  python setup.py build
}

package() {
  cd "$srcdir/$_PkgName"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
}
