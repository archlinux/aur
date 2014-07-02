# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=epour
pkgname=$_pkgname-git
pkgver=0.5.2.0.r24.gab1d793
pkgrel=1
pkgdesc="Torrent client based on EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('python2-efl' 'libtorrent' 'hicolor-icon-theme')
makedepends=('git' 'python2-distutils-extra')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("git://git.enlightenment.org/apps/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | awk -F '-' '{print $2 ".r" $3 "." $4}'
}

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's/env python$/&2/' bin/epour epour/*.py epour/gui/*.py
}

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root="$pkgdir"

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" README AUTHORS
}
