# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastian Voecking <voeck@web.de>

pkgbase=mp-5
#pkgname=(mp-5-nc mp-5-qt4 mp-5-kde4 mp-5-gtk)
pkgname=(mp-5-qt4 mp-5-kde4 mp-5-gtk)
pkgver=5.2.10
pkgrel=2
arch=('i686' 'x86_64')
# Note: config.sh auto-detects during the build which libraries are available
#makedepends=('ncurses' 'qt4' 'kdelibs' 'gtk3')     # 'gtk2'
makedepends=('ncurses' 'qt4' 'kdelibs' 'gtk3')     # 'gtk2'
url="http://www.triptico.com/software/mp.html"
license=('GPL')
source=(http://triptico.com/download/mp/mp-$pkgver.tar.gz
		MinimumProfit.desktop)
md5sums=('16c425264e2728679ab5975f8e582acb'
         '7eae413ded2d6f69fba8347240b8b875')

prepare() {
  #rm -rf mp-5-nc
  #cp -a mp-$pkgver mp-5-nc

  rm -rf mp-5-qt4
  cp -a mp-$pkgver mp-5-qt4

  rm -rf mp-5-kde4
  cp -a mp-$pkgver mp-5-kde4

  rm -rf mp-5-gtk
  mv mp-$pkgver mp-5-gtk
}

build() {
  #cd "$srcdir/mp-5-nc"
  #./config.sh --prefix=/usr --without-gtk --without-qt4 --without-kde4
  #make

  cd "$srcdir/mp-5-qt4"
  ./config.sh --prefix=/usr --without-gtk
  make

  cd "$srcdir/mp-5-kde4"
  ./config.sh --prefix=/usr --with-kde4
  make

  cd "$srcdir/mp-5-gtk"
  ./config.sh --prefix=/usr --without-qt4 --without-kde4
  make
}

#package_mp-5-nc() {
#  pkgdesc="Text editor for programmers (ncurses front-end)"
#  depends=('ncurses')
#  _pkgname='mp-5'
#  provides=($_pkgname)
#  conflicts=($_pkgname)
#
#  install -Dm644 MinimumProfit.desktop "$pkgdir/usr/share/applications/MinimumProfit.desktop"
#
#  cd mp-5-nc
#  install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
#  install -dm755 "$pkgdir/usr/bin"
#  make DESTDIR="$pkgdir" install
#}

package_mp-5-qt4() {
  pkgdesc="Text editor for programmers (QT4 front-end)"
  depends=('qt4')
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  install -Dm644 MinimumProfit.desktop "$pkgdir/usr/share/applications/MinimumProfit.desktop"

  cd mp-5-qt4
  install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
}

package_mp-5-kde4() {
  pkgdesc="Text editor for programmers (KDE4 front-end)"
  depends=('kdelibs')
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  install -Dm644 MinimumProfit.desktop "$pkgdir/usr/share/applications/MinimumProfit.desktop"

  cd mp-5-kde4
  install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
}

package_mp-5-gtk() {
  pkgdesc="Text editor for programmers (GTK front-end)"
  #depends=('gtk2')
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

