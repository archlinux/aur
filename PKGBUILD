 # Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-nano
pkgver=5.24.1
pkgrel=1
pkgdesc="A minimal plasma shell package intended for embedded devices."
arch=('any')
url="https://invent.kde.org/plasma/plasma-nano"
license=('GPL2')
groups=()
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'git') 
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('95299f2acc9c9205d93951263d5b499487ee10d00d097393f167d234ac01163f')

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
 
