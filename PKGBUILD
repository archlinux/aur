# $Id$
# Maintainer: Arthur Vuillard <arthur@hashbang.fr>

_pkgbase="joe"
pkgname="python2-${_pkgbase}"
pkgver="0.0.5"
pkgrel=3
pkgdesc="A .gitignore magician in your command line"
arch=('any')
url="http://github.com/karan/joe/"
license='MIT'
depends=('python2' 'python2-docopt')
provides=('joe')
makedepends=('python2-setuptools' 'git')
source=("git+https://github.com/karan/joe.git#tag=$pkgver")
sha256sums=('SKIP')

prepare(){
  cd "${srcdir}/${_pkgbase}"
  git submodule update --init
}

build() {
  cd "${srcdir}/${_pkgbase}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_pkgbase}"
  python2 setup.py test
}

package() {
  cd "${srcdir}/${_pkgbase}"
  python2 setup.py install -O1 --prefix=/usr --root="$pkgdir/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
