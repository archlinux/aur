# Maintainer: Luis Miguel García-Cuevas González <luismiguelgcg at gmail dot com>

pkgname='python-coolprop-git'
_pkgname='python-coolprop'
pkgver=r5201.71a82276
pkgrel=1
arch=('any')
pkgdesc='Python wrapper over CoolProp, the open-source thermodynamic and transport properties database'
url='https://github.com/CoolProp/CoolProp'
license=('MIT')
source=("$_pkgname::git+https://github.com/CoolProp/CoolProp"
)
depends=('python')
makedepends=('python'
             'cython')
b2sums=('SKIP')

pkgver() {

  cd "$srcdir/$_pkgname/" || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

  cd "$srcdir/$_pkgname/wrappers/Python/" || exit
  python setup.py build

}

package() {

  cd "$srcdir/$_pkgname/wrappers/Python/" || exit
  python setup.py install --root="$pkgdir" --optimize=1

}

prepare() {

  cd "$srcdir/$_pkgname/" || exit
  git submodule init
  git submodule update

}
