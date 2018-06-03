# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# with contributions from tuusjr

pkgname=finfaktura
pkgver=2.2.0
pkgrel=2
pkgdesc="Fryktelig Fin Faktura is an accountancy/billing program for Norwegian businesses. Bills are created as PDF or F60 forms."
url="https://sourceforge.net/projects/finfaktura/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2' 'python2-reportlab' 'python2-pyqt4')
validpgpkeys=('7F09D1F81C3E17584AC9C61A4F5AD64DFA687324')
source=("http://downloads.sourceforge.net/sourceforge/finfaktura/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('e4eb3097603f9c8e3157b834be90169c'
         'SKIP')


prepare() {
  cd "$pkgname-$pkgver"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
