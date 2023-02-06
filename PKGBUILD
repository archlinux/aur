# Maintainer: Melanie Scheirer <mel@nie.rs>

pkgname=attica-git
_name=${pkgname%-git}
pkgver=v5.102.0.r9.g2bab489
pkgrel=1
pkgdesc='Qt5 library that implements the Open Collaboration Services API'
arch=(x86_64)
url='https://projects.kde.org/projects/frameworks/attica'
license=(LGPL)
depends=(qt6-base)
makedepends=(git extra-cmake-modules-git)
groups=(kf5)
conflicts=(attica)
provides=(attica)
source=("git+https://invent.kde.org/frameworks/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DQT_DEFAULT_MAJOR_VERSION=6 -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
