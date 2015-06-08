# Contributor: Gour <gour@gour-nitai.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibstuff  
pkgver=1.0.0
pkgrel=3
pkgdesc="Collection of python2 scripts and modules for interacting with BibTeX style databases of citation references"
url="http://code.google.com/p/bibstuff/"
arch=('any')
license=('MIT')
depends=('python2-simpleparse')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('02dfd248f265e30fc70641f65c2d0208')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir

  # copying license information
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt

  # copying readme information
  install -Dm644 README.txt $pkgdir/usr/share/doc/$pkgname/README.txt

  # copying examples directory
  install -d $pkgdir/usr/share/doc/$pkgname/examples
  cp examples/* $pkgdir/usr/share/doc/$pkgname/examples
  for _i in $pkgdir/usr/lib/python2.7/site-packages/bibgrammar.py \
    $pkgdir/usr/share/doc/bibstuff/examples/jmaker.py \
    $pkgdir/usr/lib/python2.7/site-packages/bibname.py
  do
    sed -i '1s+python+python2+' $_i
  done
}
