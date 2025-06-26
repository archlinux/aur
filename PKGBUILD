# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-forceblur-git
pkgver=r366.5feff4aac
pkgrel=2
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/kwin-effects-forceblur"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy)
optdepends=("kwin-x11: for X11" "kwin: for Wayland")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=(git extra-cmake-modules qt6-tools kwin kwin-x11)
source=("$pkgname::git+${url}.git")
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$pkgname"
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

