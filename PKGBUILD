# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (extra repo):
# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-meld
_pkgname=dolphin
pkgver=22.04.2
pkgrel=1
pkgdesc='KDE File Manager, using Meld rather than Kompare'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
license=(LGPL)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kactivities kuserfeedback)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu')
groups=(kde-applications kde-system)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig}
        "dolphin-meld.patch")
sha256sums=('c2e3c4c16ff42a224f3dc72c79b2f641d1648d439bfa8c06635784843e58d147'
            'SKIP'
            '9bf8e1d53bb482e3cc2f3a114fb894fc3d0216ad2933d0c6e1f0b7df6d640b7a')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  mkdir -p build
  cd $_pkgname-$pkgver
  patch -p1 -i ../$pkgname.patch
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
