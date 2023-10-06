# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular
pkgver=23.08.1
pkgrel=2
pkgdesc='Document Viewer'
arch=(x86_64)
url='https://apps.kde.org/okular/'
license=(GPL LGPL FDL)
groups=(kde-applications kde-graphics)
depends=(djvulibre libspectre libkexiv2 poppler-qt5 kpty5 kactivities5 threadweaver5 kparts5 purpose5 discount phonon-qt5)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools5 khtml chmlib)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)'
            'kde-cli-tools: to configure web shortcuts' 'plasma-workspace: to configure web shortcuts')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/graphics/okular/-/commit/043c3521.patch)
sha256sums=('43b3732d701692324967e767ecf69f6b4d957765b5aba24a4dfa6efc8a494817'
            'SKIP'
            'cc700b975e2eb4e07356ad3c0ce2c927698d1a0b6b0da89d386d7181f40ef1e6')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(!zipman)

prepare() {
  patch -d $pkgname-$pkgver -p1 < 043c3521.patch # Fix markdown rendering
}
 
build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
