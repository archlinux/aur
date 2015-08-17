# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=finfaktura
pkgver=2.0.8
pkgrel=1
pkgdesc="Fryktelig Fin Faktura is an accountancy/billing program for Norwegian businesses. Bills are created as PDF or F60 forms."
url="https://sourceforge.net/projects/finfaktura/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2>=2.5.0' 'python2-reportlab' 'python2-pyqt')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://downloads.sourceforge.net/sourceforge/finfaktura/${pkgname}-${pkgver}.tar.gz")
md5sums=('bbfc5b89cfe13eb63e7e6a57969c466c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # From http://allanmcrae.com/2010/10/big-python-transition-in-arch-linux/
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')
}

package() {
  cd $startdir/src/$pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
  mv $pkgdir/usr/bin/faktura.py $pkgdir/usr/bin/finfaktura
}
