# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
#Maintainer: Ben Mazer <blm@groknil.org>

pkgname=pychecker
pkgver=0.8.19
pkgrel=6
pkgdesc="Python code checker"
arch=('any')
url="http://pychecker.sourceforge.net"
license=('custom')
depends=('python2')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('50f3d87a0ea80235761eb0ff078dc7e815848c356cea2bdf12bb699edc6d3301252acebaf6ab6aa961849d740dc38bc9b6deb7cfe956e7fff83a104750adfa18')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  chmod 0644 ChangeLog
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         $(find . -name '*.py')
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
  install -D -m 644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
