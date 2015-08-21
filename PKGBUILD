# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# with contributions from tuusjr
pkgname=finfaktura
pkgver=2.0.9
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
source=("http://downloads.sourceforge.net/sourceforge/finfaktura/${pkgname}-${pkgver}.tar.gz")
md5sums=('0541e2854c0e5a94d842095970321c0e')

build() {
  cd $srcdir/$pkgname-$pkgver
  # From http://allanmcrae.com/2010/10/big-python-transition-in-arch-linux/
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
