# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-forceblur-git
pkgver=r12.d10a6bb72
pkgrel=1
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/kwin-forceblur-wayland"
license=(GPL3)
depends=(kio knotifications kwin kcrash kglobalaccel)
makedepends=(git extra-cmake-modules qt6-tools)
source=("$pkgname::git+${url}.git")
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

