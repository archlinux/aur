# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

_gitname=kaccounts-providers
pkgname=kaccounts-providers-git
pkgver=v15.12.0.r10.gd7f438c
pkgrel=1
pkgdesc='Small system to administer web accounts for the sites and services across the KDE desktop, including: Google, Facebook, Owncloud, IMAP, 
Jabber and others'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/playground/base/kde-accounts/kaccounts-providers'
license=('GPL')
depends=('kaccounts-integration')
makedepends=('extra-cmake-modules' 'git' 'intltool')
provides=('kaccounts-providers')
conflicts=('kaccounts-providers')
install=$pkgname.install
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
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
