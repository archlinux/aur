# Maintainer: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.8
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'qt5-multimedia' 'qt5-webkit')
makedepends=('qt5-tools')
source=(https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('6bb4e09612b20705819cde1e0f954df8443e6b2a6caafec3f201bf85e28bfd184f8dbc805b54ba7bb4eca52a7d4d57f60adef9bf566069df1725cb7dab1ade8e')

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

