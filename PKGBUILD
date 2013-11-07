# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=epour-git
_pkgname=${pkgname%-*}
pkgver=0.5.2.0.r10.gfcb3922
pkgrel=1
pkgdesc="Torrent client based on EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3' 'MIT')
depends=('python2-efl' 'libtorrent' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'python2-distutils-extra')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("git://git.enlightenment.org/apps/$_pkgname.git")
md5sums=('SKIP')

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
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 epour/gui/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
