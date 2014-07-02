# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=epour
pkgver=0.5.2.0
pkgrel=2
pkgdesc="Torrent client based on EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('python2-efl' 'libtorrent' 'hicolor-icon-theme')
makedepends=('git' 'python2-distutils-extra')
install=$pkgname.install
source=("git://git.enlightenment.org/apps/$pkgname.git#tag=epour-$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  sed -i 's/env python$/&2/' bin/epour epour/*.py epour/gui/*.py
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --root="$pkgdir" --optimize=1

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README
}
