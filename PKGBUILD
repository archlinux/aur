# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org> 

pkgname=kaccounts-integration-git
pkgver=r806.1689783
pkgrel=1
pkgdesc='Small system to administer web accounts for the sites and services across the KDE desktop, including: Google, Facebook, Owncloud, IMAP, 
Jabber and others'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kdereview/kaccounts-integration'
license=(GPL)
depends=(kcmutils kio signon libaccounts-qt5) # kdepimlibs-git
makedepends=(extra-cmake-modules git kdoctools)
optdepends=('kaccounts-providers-git: Provider files')
provides=('kaccounts-integration')
conflicts=('kaccounts-integration')
source=("git://anongit.kde.org/kaccounts-integration.git")
sha256sums=('SKIP')

pkgver() {
  cd kaccounts-integration
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kaccounts-integration \
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
