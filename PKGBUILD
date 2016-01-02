# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=pygmed
pkgver=0.1
pkgrel=2
pkgdesc="A simple editor for ".desktop" files."
arch=(any)
url="http://sourceforge.net/projects/pygmed/"
license=('GPL')
depends=('wxpython')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop") # A .desktop file editor without a .desktop file
md5sums=('96428ecd869cdb104e0bc6074e2ab70e'
         '40df8b3c1057b6191db68f1abc49af9b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  sed -i "s|\(bin/python\).*|\12|" `grep -Erl "bin/python" .`

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/"

  # desktop file
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
