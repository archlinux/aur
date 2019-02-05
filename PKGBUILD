# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastian Voecking <voeck@web.de>

pkgbase=mp-5
pkgname=(mp-5-gtk mp-5-nc mp-5-qt5)
pkgver=5.30
pkgrel=2
arch=('x86_64')
url="http://www.triptico.com/software/mp.html"
license=('GPL')
#'mp_doccer' 'perl-grutatxt'
makedepends=('gtk3' 'ncurses' 'qt5-base')
options=(!makeflags)
source=(http://triptico.com/download/mp/mp-$pkgver.tar.gz
		MinimumProfit.desktop)
md5sums=('244505cfe62023fe4890492f88cf1298'
         '7eae413ded2d6f69fba8347240b8b875')

prepare() {
  rm -rf mp-5-gtk
  cp -a mp-$pkgver mp-5-gtk

  rm -rf mp-5-nc
  cp -a mp-$pkgver mp-5-nc

  rm -rf mp-5-qt5
  cp -a mp-$pkgver mp-5-qt5
}

# Note: config.sh detects during the build which libraries are available
build() {
  cd "$srcdir/mp-5-gtk"
  ./config.sh --prefix=/usr --without-curses --without-kde4 --without-qt
  make

  cd "$srcdir/mp-5-nc"
  ./config.sh --prefix=/usr --without-gtk --without-kde4 --without-qt
  make

  cd "$srcdir/mp-5-qt5"
  ./config.sh --prefix=/usr --without-curses --without-gtk --without-kde4 --without-qt4
  make
}

package_mp-5-gtk() {
  pkgdesc="Text editor for programmers (GTK front-end)"
  depends=('gtk3')
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  install -Dm644 MinimumProfit.desktop "$pkgdir/usr/share/applications/MinimumProfit.desktop"

  cd mp-5-gtk
  install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
}

package_mp-5-nc() {
  pkgdesc="Text editor for programmers (ncurses front-end)"
  depends=('ncurses')
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  install -Dm644 MinimumProfit.desktop "$pkgdir/usr/share/applications/MinimumProfit.desktop"

  cd mp-5-nc
  install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
}

package_mp-5-qt5() {
  pkgdesc="Text editor for programmers (QT5 front-end)"
  depends=('qt5-base')
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  install -Dm644 MinimumProfit.desktop "$pkgdir/usr/share/applications/MinimumProfit.desktop"

  cd mp-5-qt5
  install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
}

