# Maintainer: zan <zan@420blaze.it>
# Contributor Andrea Scarpino <andrea@archlinux.org>

pkgname=solid-git
pkgver=5.240.0_r861.g86e4d87
pkgrel=1
pkgdesc='Hardware integration and detection'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt6-declarative media-player-info udisks2 upower-git)
makedepends=(extra-cmake-modules-git git qt6-tools)
groups=(kf6)
conflicts=(solid)
provides=(solid)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
md5sums=('SKIP')

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
