# Maintainer: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.10
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('desktop-file-utils' 'gst-plugins-good' 'gtk-update-icon-cache' 'qt5-multimedia' 'qt5-webkit')
makedepends=('qt5-tools')
source=(https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('74a493a93378f9f3bfb3b476cf80df1f4e565ce2f89116ee898a45a4941aa5de557a6ab80e284298fefa4d832bfca58bf7163bbdef467c4fea7091001fac1fa4')

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

