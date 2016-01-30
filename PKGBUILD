# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org> 

_gitname=kaccounts-integration
pkgname=kaccounts-integration-git
pkgver=v15.07.80.r70.g9b792c9
pkgrel=1
pkgdesc='Small system to administer web accounts for the sites and services across the KDE desktop, including: Google, Facebook, Owncloud, IMAP, 
Jabber and others'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kdereview/kaccounts-integration'
license=(GPL)
depends=(kcmutils signon libaccounts-qt5)
makedepends=(extra-cmake-modules git kdoctools)
optdepends=('kaccounts-providers-git: Provider files')
provides=('kaccounts-integration')
conflicts=('kaccounts-integration')
source=("git://anongit.kde.org/$_gitname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
