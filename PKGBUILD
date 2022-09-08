# Maintainer: Cpt_Huntsman <other.plan1133@fastmail.com>

pkgname=dolphin-nospace
_pkgname=dolphin
pkgver=22.08.1
pkgrel=1
pkgdesc="KDE File Manager (with DuckSoft's Space Patch)"
arch=(x86_64)
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
provides=(dolphin)
conflicts=(dolphin)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit kactivities kuserfeedback)
makedepends=(extra-cmake-modules kdoctools packagekit-qt5)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu' 'packagekit-qt5: service menu installer')
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"
        "ducksoft-want-my-space-back.patch")
sha256sums=('067bef1d24c411ba2bad2aee62ed10dd584c4c43184cbddfbefa775c9a1c9be9'
            '21a50881ce6dce2a831d8fc0e2d1339a158aaabc65986bbe3c9e990a4a71fcbe')

prepare() {
    cd "$srcdir"/$_pkgname-$pkgver
    patch -p1 < ../ducksoft-want-my-space-back.patch
}
              
build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
