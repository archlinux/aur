# Maintainer: Booker <lordbooker@gmail.com>
pkgname=linux-g13-driver-git
pkgver=2.6.2.r0.g75cb184
pkgrel=1
pkgdesc="User-space driver and Qt6 configuration tool for the Logitech G13 gameboard (Modernized Fork)"
arch=('x86_64')
url="https://github.com/Lordbooker/linux-g13-driver"
license=('GPL-2.0-only')
depends=('libusb' 'qt6-base' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'qt6-tools')
optdepends=('qt6-translations: translated standard dialog buttons'
            'qt6-wayland: native Wayland sessions')
provides=('linux-g13-driver')
conflicts=('linux-g13-driver' 'g13-driver')
install=linux-g13-driver-git.install
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/linux-g13-driver"
  # z. B. 2.0.0.r0.g616cfe1 (Tag v2.0.0, 0 Commits danach)
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$srcdir/linux-g13-driver/g13-driver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
