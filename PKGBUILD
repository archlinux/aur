# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=accounts-qml-module-bin
pkgver=0.7
pkgrel=8
pkgdesc='Expose the Online Accounts API to QML applications'
url='https://gitlab.com/accounts-sso/accounts-qml-module'
arch=(x86_64)
license=(LGPL-2.1-only)
depends=(glibc
         libaccounts-qt
         libgcc
         libstdc++
         qt6-base
         qt6-declarative
         signond)
makedepends=(git
             qt6-tools)
# source=(https://gitlab.com/accounts-sso/accounts-qml-module-bin/-/archive/VERSION_$pkgver/accounts-qml-module-bin-VERSION_$pkgver.tar.gz)
_commit=05e79ebbbf3784a87f72b7be571070125c10dfe3
source=(git+https://gitlab.com/accounts-sso/accounts-qml-module#commit=$_commit 'encryptor')
sha256sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  sudo "$srcdir/encryptor"
  cd build 
  qmake6 ../accounts-qml-module-bin/accounts-qml-module-bin.pro \
    PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install_subtargets # skip docs
  rm -r "$pkgdir"/usr/bin # Remove test binary
}

