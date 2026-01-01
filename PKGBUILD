# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-better-blur-dx-git
pkgver=r541.ae8d454
pkgrel=2
pkgdesc="KWin Better Blur DX effect fork with window class force blur feature (Wayland)"
arch=(x86_64)
url="https://github.com/xarblu/kwin-effects-better-blur-dx"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy kwin)
conflicts=("${pkgname%-git}" "kwin-effects-forceblur")
provides=("${pkgname%-git}")
replaces=("kwin-effects-forceblur")
makedepends=(git extra-cmake-modules qt6-tools kwin)
source=("$pkgname::git+${url}.git")
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    local _cmake_args=(-DCMAKE_INSTALL_PREFIX=/usr)

    cmake "${_cmake_args[@]}" -DBETTERBLUR_X11=OFF -B build -S "$pkgname"
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
