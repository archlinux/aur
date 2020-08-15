# Maintainer: Andy Kluger <https://t.me/andykluger>

# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-meld
_pkgname=dolphin
pkgver=20.08.0
pkgrel=1
pkgdesc="KDE File Manager, using Meld rather than Kompare"
arch=(x86_64)
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit)
makedepends=(extra-cmake-modules kdoctools packagekit-qt5)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu' 'packagekit-qt5: service menu installer')
groups=(kde-applications kde-system)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig}
        "dolphin-meld.patch")
sha256sums=('fe5a68d9afd0771ba9ffc2d5d79e7bc43da85fd3ee3c2493a9a2d5c359c3cd6f'
            'SKIP'
            '13107b72348bd7eea5665196dc4a37c21bff131bbc8457efe77ef8c3e9450c7b')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

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
