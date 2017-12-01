# Maintainer: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.9
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('desktop-file-utils' 'gst-plugins-good' 'gtk-update-icon-cache' 'qt5-multimedia' 'qt5-webkit')
makedepends=('qt5-tools')
source=(https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('1c068cc58e2c24123d62101e629e0138d5d9e3773f841e0aa8fe7a29e057e8397e2d60cfd1d3ebe81240c9ce9caf25ad61da1a37d41965daac951b45c906f80b')

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

