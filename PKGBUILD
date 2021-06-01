# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Arkham <arkham@archlinux.us>
# Contributor: brix <blbennett@telus.net>

pkgname=ghextris
pkgver=0.9.0
pkgrel=8
pkgdesc='Tetris-like game on a hexagonal grid'
arch=('any')
# the https certificate is invalid
url='http://mjr.iki.fi/software/ghextris'
license=('GPL')
depends=('gnome-python')
makedepends=('gettext' 'setconf')
source=("http://mjr.iki.fi/software/${pkgname}_$pkgver-1.tar.gz")
sha256sums=('cd67776a35561879407208a5ecd201a23fcd5726a4962eaba1e25219c44c4cd6')

prepare() {
  cd "$pkgname-$pkgver"

  setconf install.sh BINDIR '"$PREFIX/bin"'
  setconf install.sh SHAREDIR '"$PREFIX/share/ghextris"'
  setconf install.sh REALSHAREDIR '"$REALPREFIX/share/ghextris"'

  sed -i -e 's,share/games,share,' install.sh
  sed -i -e 's,python2.3,python2,;s,whrandom,random,g' "$pkgname.py"

  # Adjust the image sizes for DPI > 96
  sed -i 's/24/48/;s/26/52/;s/14/28/' ghextris.py
}

package() {
  cd "$pkgname-$pkgver"

  ./install.sh "$pkgdir/usr" /usr
}

# vim: ts=2 sw=2 et:
