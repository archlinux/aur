
pkgname=python2-bencode
_realname=bencode
pkgver=1.0
pkgrel=1
pkgdesc="The BitTorrent bencode python module as a light-weight, standalone package."
url="http://pypi.python.org/pypi/BitTorrent-bencode"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
source=(https://pypi.python.org/packages/source/b/bencode/$_realname-$pkgver.tar.gz)
md5sums=('400dd42ff346eb7db91245403f8f2b7b')


build(){
  cd "$srcdir/$_realname-$pkgver"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package(){
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
