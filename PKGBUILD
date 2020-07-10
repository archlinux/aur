# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >
# Still broken, needs a more recent version of KLook than the one in the AUR
# Check: https://invent.kde.org/graphics/klook/-/tree/qt5
#
# Even with that version installed, it sometimes fails to build,
# I'm still looking into that (contributions are welcome!)

_pkgname=dolphin
pkgname=dolphin-klook
pkgver=20.04.3
pkgrel=1
pkgdesc="KDE File Manager with KLook support"
arch=(x86_64)
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu')
groups=(kde-applications kde-system)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig} 'dolphin-klook.patch')
sha256sums=('5e493e898e02005780b59474f506904742625b50e4669c113906d4f30daa863e'
            'SKIP'
            'feba65f17ca4f59c0bcdb1e24c4ff7f0a2ec79384199b6b8af502c5c7fbb8ab5')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p build
  patch -Np1 -i "${srcdir}/dolphin-klook.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  cmake ..
  make
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
