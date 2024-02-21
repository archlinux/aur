# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=accounts-qml-module
pkgver=0.7
pkgrel=6
pkgdesc='Expose the Online Accounts API to QML applications'
url='https://gitlab.com/accounts-sso/accounts-qml-module'
arch=(x86_64)
license=(LGPL)
depends=(gcc-libs
         glibc
         libaccounts-qt
         qt6-base
         qt6-declarative
         signond)
makedepends=(git
             qt6-tools)
# source=(https://gitlab.com/accounts-sso/$pkgname/-/archive/VERSION_$pkgver/$pkgname-VERSION_$pkgver.tar.gz)
_commit=05e79ebbbf3784a87f72b7be571070125c10dfe3
source=(git+https://gitlab.com/accounts-sso/accounts-qml-module#commit=$_commit)
sha256sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build 
  qmake6 ../$pkgname/$pkgname.pro \
    PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install_subtargets # skip docs
  rm -r "$pkgdir"/usr/bin # Remove test binary
}
