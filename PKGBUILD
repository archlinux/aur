# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=finfaktura
pkgver=2.0.6
pkgrel=2
pkgdesc="Fryktelig Fin Faktura is an accountancy/billing program for Norwegian businesses. Bills are created as PDF or F60 forms."
url="https://code.google.com/p/$pkgname/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2>=2.5.0' 'python-reportlab' 'python2-pyqt')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://finfaktura.googlecode.com/files/$pkgname-$pkgver.zip")
md5sums=('bc861605f448d5d962bd36ae36a8f5db')
build() {
  cd $startdir/src/$pkgname-$pkgver

  # From http://allanmcrae.com/2010/10/big-python-transition-in-arch-linux/
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')

  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

  mv $pkgdir/usr/bin/faktura.py $pkgdir/usr/bin/finfaktura
}
