# Maintainer: zan <zan@nie.rs>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=baloo-git
pkgver=5.240.0_r3149.gf6974075
pkgrel=1
pkgdesc="A framework for searching and managing metadata"
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(lmdb kfilemetadata-git kidletime-git kio-git)
makedepends=(extra-cmake-modules-git kdoctools-git git python)
groups=(kf6)
provides=(baloo)
conflicts=(baloo)
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
