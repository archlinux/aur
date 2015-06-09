# Maintainer: xduugu
pkgname=kdiff3-qt
_pkgname=${pkgname%-*}
pkgver=0.9.98
pkgrel=2
pkgdesc="A file comparator/merge tool (lightweight qt version without KDE dependencies)"
arch=('i686' 'x86_64')
url="http://kdiff3.sourceforge.net/"
license=('GPL')
depends=('qt5-base')
provides=("kdiff3=$pkgver")
conflicts=('kdiff3')
# remove !docs if you need the help documents
options=('!docs' '!emptydirs')
source=(http://downloads.sourceforge.net/project/$_pkgname/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz)
md5sums=('b52f99f2cf2ea75ed5719315cbf77446')
sha256sums=('802c1ababa02b403a5dca15955c01592997116a24909745016931537210fd668')

build() {
  cd "$srcdir/$_pkgname-$pkgver/src-QT4/"

  sed -i 's@/usr/local@/usr@g' kdiff3.pro kreplacements/kreplacements.cpp

  qmake-qt5 kdiff3.pro
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/src-QT4/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
