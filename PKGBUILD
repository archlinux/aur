# Maintainer: Nafis <mnabid.25@outlook.com>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>
# Contributor: David P. <megver83@parabola.nu>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-root
_pkgname=dolphin
pkgver=21.12.1
pkgrel=1
pkgdesc='KDE File Manager, patched to be able to run as root'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kactivities kuserfeedback)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu')
provides=('dolphin')
conflicts=('dolphin')
groups=(kde-applications kde-system)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig}
        '0001-Defuse-root-block.patch')
sha256sums=('6a4b16562b31574b7bc35eb46c754d4f19b047e182ec8a9487cfd1db73af254c'
            'SKIP'
            'e55397192734011de342ade949a1b9ab0fce1bd760533bbccd11e99fde070cd7')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  # root shall be allowed once again
  patch -d $_pkgname-$pkgver -Np1 < 0001-Defuse-root-block.patch
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
