 # Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-mobile
pkgver=5.24.1
pkgrel=1
pkgdesc="Plasma Mobile shell components."
arch=('any')
url="https://invent.kde.org/plasma/plasma-mobile"
license=('GPL3')
groups=()
depends=(
  plasma-nano
  plasma-nm
  powerdevil
  modemmanager-qt
  plasma-wayland-session
)
optdepends=(
  'plasma-settings: Settings application for Plasma Mobile'
  'plasma-dialer: Phone application'
  'plasma-workspace-wallpapers: A large wallpaper selection for Plasma'
)
makedepends=(cmake extra-cmake-modules git)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('6e0d3aeac4c50835b33d2200ab9829c6b4e42739306c50b333a995a5a225dbc2')

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
 
