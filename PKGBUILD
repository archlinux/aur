# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python2-pytune
pkgver=0.1
pkgrel=3
pkgdesc='Analyze wave music files. Includes chordfinder'
arch=('x86_64' 'i686')
license=('GPL')
url='https://github.com/milanboers/pytune'
depends=('python2')
makedepends=('python2-distribute' 'cython2' 'setconf')
source=("$pkgname.tar.gz::https://nodeload.github.com/milanboers/pytune/tar.gz/master"
        "$pkgname.png")
sha256sums=('4ba82178ae510858cc03aa618205822399e1042132e7026a68d62d71dd782252'
            'ce3017c266475d912a4f2507938b1eb040e4396630528e547681f7c384e3a148')
_exec=('chordfinder')
_name=('Chordfinder')

build() {
  cd "$srcdir"
  gendesk -n
  setconf "$pkgname.desktop" Categories "Audio;"
  sed -i 's:python:python2:' pytune-master/chordfinder.py
  sed -i 's:from pytune import:import:' pytune-master/chordfinder.py
}

package() {
  cd "$srcdir/pytune-master/pytune"
  python2 setup.py install --root="$pkgdir" --optimize=1
  cd "$srcdir"
  install -Dm755 pytune-master/chordfinder.py "$pkgdir/usr/bin/chordfinder"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/chordfinder.desktop"
}

# vim:set ts=2 sw=2 et:
