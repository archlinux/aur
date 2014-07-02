# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=epour
pkgname=$_pkgname-git
pkgver=0.5.2.0.r25.gab89f1a
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

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root="$pkgdir" --optimize=1

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" README AUTHORS
}
