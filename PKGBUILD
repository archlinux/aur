# Maintainer: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.6
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'qt5-multimedia' 'qt5-webkit')
makedepends=('qt5-tools')
source=(https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('773c22b61e6eea4348f1987a27049bec3d2f2b5834f4e24a5528b69b43fc93a2bca4a408c1cb1f2346e6aa1a2a000b0f8dea9a2fde64caea55e296ffcca68678')

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

