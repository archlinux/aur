# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-palm
pkgver=0.1.7
pkgrel=2
pkgdesc="Fast protocol buffer library for Python (Protobufs Are Lightweight Messages)"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/bumptech/palm"
license=('custom')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz
        LICENSE)
md5sums=('f49942ae4746191e73e0935c4c31c6ae'
         '6d0bd0996abe85ce1b772cbe989160c8')
sha256sums=('4d6f4cb18ae861ac99c27abb454fdce06a627aa326fb6d8e81ce2c5d0f483ac7'
            '6b7c8132ae8c56d2090dbecf0e66a91bf06f6ed3d75ae4e7a001d69fa22990b1')
provides=('palmc' 'python2-palm')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing license...'
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
