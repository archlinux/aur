# Based on yapf 0.27.0 PKGBUILD
# Maintainer: Viliam Pucik <viliam dot pucik at pm dot me>

name=yapf
pkgname=python2-$name
pkgver=0.27.0
pkgrel=1
pkgdesc="Python style guide checker"
arch=('any')
url="https://github.com/google/yapf"
license=('Apache')
depends=('python2-setuptools')
checkdepends=('python2-nose')
source=("$name-$pkgver.tar.gz::https://github.com/google/$name/archive/v$pkgver.tar.gz")
sha512sums=('d161c232d485ce7a6173fc6d796ed9bd880736d365d61f27fd608b590dddfc3fa8fd60fa88d8ebee8e63db616761ede6f1dfa74579c8ec9df5d3c81b50dc2ade')

build() {
  cd $name-$pkgver
  python2 setup.py build
}

check() {
  cd $name-$pkgver
  nosetests2 || warning "https://github.com/google/yapf/issues/586"
}

package() {
  cd $name-$pkgver
  python2 setup.py install -O1 --root="$pkgdir"
  mv "$pkgdir"/usr/bin/yapf{,2}
}
