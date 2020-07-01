# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=kaccounts-providers-git
_name=kaccounts-providers
pkgver=v19.12.1.r40.ga530020
pkgrel=1
pkgdesc='Small system to administer web accounts for the sites and services across the KDE desktop, including: Google, Facebook, Owncloud, IMAP, 
Jabber and others'
arch=(x86_64)
url='https://projects.kde.org/projects/playground/base/kde-accounts/kaccounts-providers'
license=(GPL)
depends=(kaccounts-integration)
makedepends=(extra-cmake-modules git intltool)
provides=(kaccounts-providers)
conflicts=(kaccounts-providers)
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
