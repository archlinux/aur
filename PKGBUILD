# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Felix Mauch <felix_mauch@web.de>

pkgname=kdevelop-php-git
pkgver=v5.6.2.r3.gc967ed0
pkgrel=1
pkgdesc="PHP language and documentation plugin for KDevelop"
arch=(x86_64)
url="http://www.kdevelop.org/"
license=(GPL)
depends=(kdevelop)
makedepends=(extra-cmake-modules kdoctools kdevelop-pg-qt git)
source=("git+https://invent.kde.org/kdevelop/kdev-php.git#branch=5.6") # currently master branch fails
provides=(kdevelop-php)
conflicts=(kdevelop-php)
sha256sums=('SKIP')

pkgver() {
  cd kdev-php
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S kdev-php \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

