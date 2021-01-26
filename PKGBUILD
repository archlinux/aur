# Maintainer: Pavel Antonov <pvantonov@gmail.com>
pkgname=breeze-patched
pkgver=5.20.5.5
pkgrel=1
pkgdesc="Artwork, styles and assets for the Breeze visual style for the Plasma Desktop"
arch=(i686 x86_64)
url="https://kde.org/plasma-desktop/"
license=('LGPL')
groups=()
depends=(breeze-icons frameworkintegration hicolor-icon-theme kdecoration kwayland)
makedepends=(extra-cmake-modules kcmutils)
optdepends=('breeze-gtk: Breeze widget style for GTK applications'
            'kcmutils: for breeze-settings')
groups=(plasma)
provides=(breeze)
conflicts=(breeze)
replaces=(breeze)
backup=()
options=()
install=
changelog=
source=("https://download.kde.org/stable/plasma/5.20.5/breeze-5.20.5.tar.xz"{,.sig}
        "1.patch")
sha256sums=('d43845a34e08d393bac182d9ede863950d33e207c7f2841a8cd419aa182cf507'
            'SKIP'
            'ac87674325ab48ad9be1174902a23ed8ebdb58744062f226aaec9242c387cd0c')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>
noextract=()

prepare() {
    cd "breeze-5.20.5"
    patch --forward --strip=1 --input="${srcdir}/1.patch"
}

build() {
  cmake -B build -S breeze-5.20.5 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
