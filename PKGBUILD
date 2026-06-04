# Stub PKGBUILD to reserve package name
pkgname=oa-sdk-git
pkgver=0.0.1
pkgrel=1
pkgdesc="OA SDK - Development headers and libraries for OA (git version)"
arch=(x86_64)
url="https://github.com/empyrealm/oa"
license=(MIT)
depends=(oa-git)
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
  cmake .. -DCMAKE_BUILD_TYPE=Release -DOA_BUILD_SDK=ON
  make
}

package() {
  cd oa/build
  make DESTDIR="$pkgdir" install
}
