# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-forceblur-git
pkgver=r1.07fafebed
pkgrel=1
pkgdesc="KWin Wayland Force Blur effect (disable Blur and enable Blur+ in System Settings)"
arch=(x86_64)
url="https://github.com/taj-ny/kwin-forceblur-wayland"
license=(GPL3)
depends=(kio knotifications kwin kcrash kglobalaccel)
makedepends=(git extra-cmake-modules qt6-tools)
source=("$pkgname::git+${url}.git#branch=plugin")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$pkgname"
    make -j"$(nproc)" -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

