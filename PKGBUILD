# Maintainer: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray-git
_pkgname=tail-tray
pkgver=0.2.27.r2.g0962d80
pkgrel=1
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=(x86_64 aarch64)
url='https://github.com/SneWs/tail-tray'
license=(GPL-3.0-or-later)
conflicts=('tail-tray')
depends=(tailscale qt6-base davfs2 knotifications)
makedepends=(git extra-cmake-modules qt6-tools)
source=("git+https://github.com/SneWs/tail-tray")
sha256sums=('SKIP')

build() {
  cmake \
    -B build \
    -S "$srcdir/$_pkgname" \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=Release \
    -D KDE_INSTALL_DIRS_NO_CMAKE_VARIABLES=ON \
    -D BUILD_TESTS=OFF \
    -D KNOTIFICATIONS_ENABLED=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --exclude=latest --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
