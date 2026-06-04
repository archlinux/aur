# Stub PKGBUILD to reserve package name
pkgname=oa-git
pkgver=0.0.1
pkgrel=1
pkgdesc="OA - High-performance C++ library for ML, audio, and compute (git version)"
arch=(x86_64)
url="https://github.com/empyrealm/oa"
license=(MIT)
depends=()
makedepends=(git cmake)
source=("git+https://github.com/empyrealm/oa.git")
sha256sums=(SKIP)

pkgver() {
  cd oa
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd oa
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd oa/build
  make DESTDIR="$pkgdir" install
}
