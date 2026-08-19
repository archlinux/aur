# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aeroshell-smodglow-x11-git')
pkgver=6.7.0_37.r1f21dee
pkgrel=1
pkgdesc="Decoration button glow effect for SMOD decorations"
arch=(x86_64)
url="https://github.com/aeroshell-desktop/smod"
license=('AGPL-3.0-or-later')
depends=(gcc-libs
         glibc
         qt6-base
         libepoxy
         kcoreaddons
         aeroshell-smod
         kwin-x11)
makedepends=(git
             extra-cmake-modules
             kdoctools)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
conflicts=(aeroshell-smodglow-x11)
provides=(aeroshell-smodglow-x11)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%} \
    -DBUILD_TESTING=OFF -DBUILD_DECORATION=OFF -DBUILD_EFFECTX11=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
