# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Felix Mauch <felix_mauch@web.de>

pkgname=kdevelop-php-git
pkgver=5.6.1.r26.g874c0bc
pkgrel=1
pkgdesc="PHP language and documentation plugin for KDevelop"
arch=(x86_64)
url="http://www.kdevelop.org/"
license=(GPL)
depends=(kdevelop)
makedepends=(extra-cmake-modules kdoctools kdevelop-pg-qt git)
source=("git+https://invent.kde.org/kdevelop/kdev-php.git")
provides=(kdevelop-php)
conflicts=(kdevelop-php)
sha256sums=('SKIP')

pkgver() {
  cd kdev-php
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S kdev-php \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

