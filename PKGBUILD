# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=summon
pkgver=1.8.10
pkgrel=1
pkgdesc="Rapid prototyping of 2D visualizations for Python."
arch=('i686' 'x86_64')
url="http://people.csail.mit.edu/rasmus/summon/index.shtml"
license=('LGPL')
depends=('python2' 'sdl' 'glut')
source=(http://people.csail.mit.edu/rasmus/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('0610bc77c39bd8cf2e7fc468fcc81f26')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python|/usr/bin/env python2|'
  sed -i 's/python -i/python2 -i/' bin/python-i
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

