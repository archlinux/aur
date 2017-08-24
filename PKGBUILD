# Maintainer: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.7
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'qt5-multimedia' 'qt5-webkit')
makedepends=('qt5-tools')
source=(https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('78a780ec49866acd1e9ebad2cc9731c7842d431e6d2fdea78b494c88040e0dbcdde99306567d7a330eb5a0373d850b56d597380a8dd7988a633074d3e64236da')

build() {
  cd $pkgname-$pkgver
  rm -rf _build
  mkdir _build

  cd _build
  qmake-qt5 CONFIG+=release PREFIX=/usr ../QuiteRSS.pro \
            DISABLE_PHONON=1
  make
}

package() {
  cd $pkgname-$pkgver/_build
  make INSTALL_ROOT="$pkgdir/" install
}

