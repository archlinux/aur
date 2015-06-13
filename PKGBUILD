# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=pyprocessing
pkgver=0.1.3.22
pkgrel=1
pkgdesc="Code up images, animation and interactions.  Uses Python and Pyglet, not Java."
arch=('any')
url="http://code.google.com/p/pyprocessing/"
license=('BSD')
depends=('pyglet')
source=(http://pyprocessing.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d10a1a6fa758754d47586a8e1a44efb8')

build() {
  cd "$srcdir/$pkgname"
  find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python$|/usr/bin/env python2|'
  msg "This must be built in an X terminal."
  # todo: figure out how to make this build on a non X terminal
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"  --optimize=0
  find "$pkgdir/" -name '*.pyc' -delete
}

