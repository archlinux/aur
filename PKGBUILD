# Merged with official ABS kidletime PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kidletime-git
pkgver=6.0.0_r424.gec86623
pkgrel=3
pkgdesc='Monitoring user activity'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc qt6-base)
makedepends=(git doxygen extra-cmake-modules-git libxss plasma-wayland-protocols-git qt6-doc qt6-tools qt6-wayland wayland-protocols)
optdepends=('libx11: XCB plugin'
            'libxcb: XCB plugin'
            'libxext: XCB plugin'
            'libxss: XCB plugin'
            'qt6-wayland: Wayland plugin'
            'wayland: Wayland plugin')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
