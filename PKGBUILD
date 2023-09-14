# Maintainer: Anthony Wang <a at exozy dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=konsole-osc52
pkgver=23.08.1
pkgrel=1
arch=(x86_64)
url='https://apps.kde.org/konsole/'
pkgdesc='KDE terminal emulator patched with OSC52 copy support'
license=(GPL LGPL FDL)
groups=(kde-applications kde-utilities)
depends=(knotifyconfig kpty kparts knewstuff)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('keditbookmarks: to manage bookmarks')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig}                 https://git.exozy.me/exozyme/exozyme/raw/branch/main/src/konsole.patch)
sha256sums=('1ea81c62e150243ba178463418e6caf01bcca5bded37992b8a1bd87dffca1f4c'
            'SKIP'
            'e7c2ca3b30e018139a139e99141202a2efc8e4e880e2965b09537f9a97865e53')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
	patch -d $pkgname-$pkgver -p1 < konsole.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
