# Maintainer: Sebastian Wilzbach <sebi [at] wilzbach [dot] me>
# Maintainer: twighk
pkgname=qbat
pkgver=0.2.2
pkgrel=3
pkgdesc="A small tool based on Qt4 to display battery stats in system tray"
arch=('i686' 'x86_64')
url="http://www.qt-apps.org/content/show.php/QBat?content=82481"
license=('GPL')
depends=('qt4')

build() {
  if [ ! -e "$SRCDEST/$pkgname-v$pkgver.tar.gz" ]; then
      #"http://repo.or.cz/w/$pkgname.git?a=snapshot;h=v$pkgver;sf=tgz" \
    wget -O "$SRCDEST/$pkgname-v$pkgver.tar.gz" \
      "http://repo.or.cz/w/$pkgname.git/snapshot/903bea112476ee0878fd99f5e47862e1b334f052.tgz"
  fi

  bsdtar xf "$SRCDEST/$pkgname-v$pkgver.tar.gz"
  firstFolder=$(ls "$srcdir" | head -n 1)
  mv "${srcdir}/${firstFolder}" "${srcdir}/${pkgname}"
  cd "$srcdir/$pkgname"

  sed -i '1a\#include <cstdio>' common.cpp
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="$pkgdir" install
}

