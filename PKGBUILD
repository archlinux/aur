# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-better-blur-dx-x11-git
pkgver=r541.ae8d454
pkgrel=1
pkgdesc="KWin Better Blur DX effect fork with window class force blur feature (X11)"
arch=(x86_64)
url="https://github.com/xarblu/kwin-effects-better-blur-dx"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy kwin-x11)
conflicts=("${pkgname%-git}" "kwin-effects-forceblur")
provides=("${pkgname%-git}")
makedepends=(git extra-cmake-modules qt6-tools kwin-x11)
source=("$pkgname::git+${url}.git")
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    local _cmake_args=(-DCMAKE_INSTALL_PREFIX=/usr -DBETTERBLUR_X11=ON)

    cmake "${_cmake_args[@]}" -B build -S "$pkgname"
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
