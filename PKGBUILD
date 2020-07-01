# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org> 

pkgname=kaccounts-integration-git
_name=${pkgname%-git}
pkgver=v20.04.2.r33.g5f0b3ad
pkgrel=1
pkgdesc='Small system to administer web accounts for the sites and services across the KDE desktop, including: Google, Facebook, Owncloud, IMAP, 
Jabber and others'
arch=(x86_64)
url='https://projects.kde.org/projects/kdereview/kaccounts-integration'
license=(GPL)
depends=(kcmutils signon-kwallet-extension signon-plugin-oauth2 signon-ui)
makedepends=(extra-cmake-modules git kdoctools)
optdepends=('kaccounts-providers-git: Provider files')
provides=(kaccounts-integration)
conflicts=(kaccounts-integration account-plugins)
source=("git+https://invent.kde.org/network/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
