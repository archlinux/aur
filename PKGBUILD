# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=unvpk-git
pkgver=r108.1f1f44f
pkgrel=3
pkgdesc='Extract Valve VPK archives'
arch=(x86_64)
url='https://github.com/panzi/unvpk'
license=(LGPL-2.1-or-later)
depends=(glibc libgcc libstdc++ fuse2 boost-libs)
makedepends=(git cmake boost)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # the project still declares CMake 2.0 compatibility, which CMake 4 rejects
  cmake -B build -S unvpk -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
