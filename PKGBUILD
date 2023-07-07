# Maintainer: Cpt_Huntsman <other.plan1133@fastmail.com>

pkgname=yakuake-alca7raz
_pkgname=yakuake
pkgver=23.04.3
pkgrel=1
pkgdesc="A drop-down terminal emulator based on KDE konsole technology"
arch=(x86_64)
url="https://apps.kde.org/yakuake/"
license=(GPL)
provides=(yakuake)
conflicts=(yakuake)
depends=(konsole kwayland hicolor-icon-theme)
makedepends=(git extra-cmake-modules)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"
        "alca7raz.patch")
sha256sums=('5e9e144e97493b0e322c37309daacfe4c1412f654023d2c82b587e5a7ea9d49f'
            'dc0ffbc6ed3c4f68e59bc1bf074d97e39e9323a95e0275e584fec9dad82312f1')

prepare() {
    cd "$srcdir"/yakuake-$pkgver
    patch -p1 < ../alca7raz.patch
}
              
build() {
  cmake -B build -S yakuake-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
