# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular
pkgver=22.04.0
pkgrel=1
pkgdesc='Document Viewer'
arch=(x86_64)
url='https://apps.kde.org/okular/'
license=(GPL LGPL FDL)
groups=(kde-applications kde-graphics)
depends=(djvulibre libspectre libkexiv2 poppler-qt5 kpty kactivities threadweaver kjs kparts purpose discount phonon-qt5)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml chmlib)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('47eebac10c3415b245907e572efe810348f6b51b8df89fe96254827aa8b2e3bf'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(debug !zipman)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
