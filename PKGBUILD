# Maintainer: m4sk1n <m4sk1n@vivaldi.net>
# Author: Steffen Weber <-boenki-gmx-de->

pkgname=otter-browser-weekly
pkgver=0.9.91.dev166
pkgrel=1
pkgdesc="Browser aiming to recreate the best aspects of the classic Opera (12.x) UI using Qt5 - weekly."
arch=('i686' 'x86_64')
url="http://otter-browser.org"
license=('GPL3')
depends=( 'qt5-script>=5.4' 'qt5-webkit' 'qt5-multimedia>=5.4' 'qt5-xmlpatterns>=5.4')
makedepends=('cmake' 'qt5-declarative>=5.4')
optdepends=('hunspell>=1.3.0: for spell checking'
            'qt5-webengine: for experimental backend using the Chromium browser project')
conflicts=('otter-browser-git' 'otter-browser')
source=("otter-browser-$pkgver.tar.bz2::http://tenet.dl.sourceforge.net/project/otter-browser/otter-browser-weekly166/otter-browser-0.9.91-dev166.tar.bz2"
        1.patch)
md5sums=('30990abfd7c3a71cd1058135c572aecb'
         '8d2c6f8c7ca94f1467542afcb64d46e7')

build() {
  cd otter-browser-0.9.91-dev166
  patch -p1 < "$srcdir/1.patch"
  lrelease resources/translations/*.ts
  cmake -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd otter-browser-0.9.91-dev166
  make DESTDIR=$pkgdir install
}