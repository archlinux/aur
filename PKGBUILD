# Contributor: Andreas Baumann <abaumann@yahoo.com>
# Contributor: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=congruity
pkgver=18
pkgrel=3
pkgdesc='A GUI application for programming Logitech(R) Harmony(TM) remote controls.'
arch=('any')
url='http://congruity.sourceforge.net/'
license=('GPL3')
depends=('desktop-file-utils' 'python2-suds' 'python-libconcord>=1.1' 'wxpython2.8')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
        "0001-Fix-mhgui-for-SupportedCapabilities-change-in-web-se.patch")
sha256sums=('16cee522b3e0b2c76ae4527110cb517af015aa8d56b1e72b7cbfa9df06739878'
            'fea8bbb603929afb743beb695de73809e606fa9d24e5810ae34ee72117317245')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Patching..."
  for i in $srcdir/*.patch; do
    patch -Np1 -i "$i"
  done

  sed -i 's@wxversion.ensureMinimal@wxversion.select@g' congruity mhgui
  sed -i 's@#!/usr/bin/env python@#!/usr/bin/env python2@g' congruity mhgui
  sed -i 's@#!/usr/bin/python@#!/usr/bin/env python2@g' mhmanager.py
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
