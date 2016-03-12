# Contributor: Kyle Keen <keenerd@gmail.com>
pkgbase=funcparserlib
pkgname=('python-funcparserlib' 'python2-funcparserlib')
pkgver=0.3.6
pkgrel=1
pkgdesc="Small and fast python based parser.  Inspired from EBNF and Haskell."
arch=('any')
url="https://github.com/vlasovskikh/funcparserlib"
license=('MIT')
depends=('python')
provides=('funcparserlib')
makedepends=('python2' 'python2-setuptools' 'python-setuptools')
source=(http://pypi.python.org/packages/source/f/$pkgbase/$pkgbase-$pkgver.tar.gz)
md5sums=('3aba546bdad5d0826596910551ce37c0')

prepare() {
  cd "$srcdir"
  mkdir -p "$pkgbase-$pkgver-py3"
  cp -r $pkgbase-$pkgver/* "$pkgbase-$pkgver-py3/"
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python|/usr/bin/env python2|'
  python2 setup.py build

  cd "$srcdir/$pkgbase-$pkgver-py3"
  python3 setup.py build
}

package_python-funcparserlib() {
  cd "$srcdir/$pkgbase-$pkgver-py3"
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}

package_python2-funcparserlib() {
  depends=('python2')
  provides=()
  cd "$srcdir/$pkgbase-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

