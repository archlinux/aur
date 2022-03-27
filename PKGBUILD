# Maintainer: zan <zan@nie.rs>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=baloo-git
_name=${pkgname%-git}
pkgver=v5.71.0.rc1.r252.g1eed0fcb
pkgrel=1
pkgdesc="A framework for searching and managing metadata"
arch=(x86_64)
url='https://invent.kde.org/frameworks/baloo'
license=(LGPL)
depends=(lmdb kfilemetadata kidletime kio)
makedepends=(extra-cmake-modules git kdoctools python)
groups=(kf5)
provides=(baloo)
conflicts=(baloo)
source=("git+https://invent.kde.org/frameworks/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
