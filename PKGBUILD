# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (extra repo):
# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-meld
_pkgname=dolphin
pkgver=23.08.3
pkgrel=1
pkgdesc='KDE File Manager, using Meld rather than Kompare'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
license=(LGPL)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")
depends=(baloo-widgets knewstuff5 kio-extras kcmutils5 kparts5 kactivities5 kuserfeedback5)
makedepends=(extra-cmake-modules kdoctools5)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose5: share context menu'
            'kio-admin: for managing files as administrator')
groups=(kde-applications kde-system)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig}
        dolphin-meld.patch)
sha256sums=('d54e877d893ddf3d59752da723c881471bc06aee2e4143ff7e034fdffd7bba9e'
            'SKIP'
            'a69abda1bd78cbaf3eb92ed645637fce1ea04a3528c90e22ab2abbdd809a0b15')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  patch -d $_pkgname-$pkgver -p1 < $pkgname.patch
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
