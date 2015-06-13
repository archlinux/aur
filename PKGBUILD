# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=funcparserlib
pkgver=0.3.6
pkgrel=1
pkgdesc="Small and fast python (2&3) based parser.  Inspired from EBNF and Haskell."
# really should be a split package
arch=('any')
url="http://code.google.com/p/funcparserlib/"
license=('MIT')
depends=('python2' 'python')
source=(http://pypi.python.org/packages/source/f/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3aba546bdad5d0826596910551ce37c0')

prepare() {
  cd "$srcdir"
  mkdir "$pkgname-$pkgver-py3"
  cp -r $pkgname-$pkgver/* "$pkgname-$pkgver-py3/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python|/usr/bin/env python2|'
  python2 setup.py build

  cd "$srcdir/$pkgname-$pkgver-py3"
  python3 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  cd "$srcdir/$pkgname-$pkgver-py3"
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}

