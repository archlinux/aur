# Maintainer: Bas Timmer <basjetimmer at yahoo dot com >

_pkgname=okular
pkgname=okular-no-purpose
pkgver=20.08.2
pkgrel=2
pkgdesc='Okular, a document viewer, without the dependency on purpose. This disables the share menu'
arch=(x86_64)
url="https://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications kde-graphics)
depends=(djvulibre libspectre libkexiv2 poppler-qt5 qca-qt5 kpty kactivities threadweaver kjs kparts discount phonon-qt5)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml chmlib)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)')
conflicts=(kdegraphics-okular)
conflicts=(okular)
replaces=(kdegraphics-okular)
replaces=(okular)
provides=(okular)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig}
         kdebug-421159.patch::"https://invent.kde.org/graphics/okular/commit/17c26699.patch")
sha256sums=('6f1885ed8050a55bb2cbf05089b452f555852e003ec7fe89fe472c0dbc92e65b'
            'SKIP'
            '30e35102e16d708a8423c0a4056637392c1c841b92eddf38da1626109c70bdf0')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>
options=(!zipman)

prepare() {
  patch -d $_pkgname-$pkgver -p1 -i ../kdebug-421159.patch # Fix scrolling issues
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDEExperimentalPurpose_FOUND=OFF \
    -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
