# Maintainer: Avi Tretiak <avi at babi dot uy>

pkgname=kwin-effects-glass-git
pkgver=r483.086741e
pkgrel=1
pkgdesc="Fork of Plasma 6 blur effect with force blur, rounded corners, refraction, and additional features (Wayland & X11)"
arch=(x86_64)
url="https://github.com/4v3ngR/kwin-effects-glass"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy)
optdepends=("kwin-x11: for X11" "kwin: for Wayland")
conflicts=()
provides=("${pkgname%-git}")
makedepends=(git cmake extra-cmake-modules qt6-tools kwin kwin-x11)
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    local _cmake_args=(
        -B build
        -S "$pkgname"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )

    cmake "${_cmake_args[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
