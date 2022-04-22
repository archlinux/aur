# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kipi-plugins
pkgver=22.04.0
pkgrel=1
pkgdesc='A collection of plugins extending the KDE graphics and image applications'
arch=(x86_64)
license=(GPL)
url='https://apps.kde.org/kipi_plugins/'
depends=(kio libkipi)
optdepends=('libmediawiki: MediaWiki Export plugin'
            'qt5-xmlpatterns: rajce.net plugin')
makedepends=(extra-cmake-modules qt5-xmlpatterns libmediawiki)
groups=(kde-applications kde-graphics)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('1a93de48397153e9f92c20130569ea63f852b9b51c5cd53c0937d2b70b34b633'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(debug)

build() {

  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
