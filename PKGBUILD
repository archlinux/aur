# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (extra repo):
# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-meld
_pkgname=dolphin
pkgver=24.08.2
pkgrel=1
pkgdesc='KDE File Manager, using Meld rather than Kompare'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
license=(LGPL-2.0-or-later)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")
depends=(baloo
         baloo-widgets
         gcc-libs
         glibc
         kbookmarks
         kcmutils
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kfilemetadata
         ki18n
         kiconthemes
         kio
         kio-extras
         kjobwidgets
         knewstuff
         knotifications
         kparts
         kservice
         ktextwidgets
         kuserfeedback
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         phonon-qt6
         qt6-base
         solid)
makedepends=(extra-cmake-modules
             kdoctools)
optdepends=('ffmpegthumbs: video thumbnails'
            'kde-cli-tools: for editing file type options'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'kdenetwork-filesharing: samba usershare properties menu'
            'kio-admin: for managing files as administrator'
            'konsole: terminal panel'
            'purpose: share context menu')
groups=(kde-applications
        kde-system)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig}
        dolphin-meld.patch)
sha256sums=('551516270762b71a53502e42cae22106642e1253e22720632a805250434145b1'
            'SKIP'
            'a69abda1bd78cbaf3eb92ed645637fce1ea04a3528c90e22ab2abbdd809a0b15')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  patch -d $_pkgname-$pkgver -p1 <$pkgname.patch
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
