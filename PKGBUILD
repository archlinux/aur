# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=fastcgi++-git
_pkgname=fastcgipp
pkgver=3.0.r113.gd70b53e
pkgrel=1
pkgdesc="This library is intended as a high-efficiency C++20 api for web development."
arch=('x86_64')
url="https://github.com/eddic/fastcgipp"
license=('LGPL')
depends=()
makedepends=('cmake' 'git')
conflicts=('fastcgi++')
provides=("fastcgi++=${pkgver}")

source=("git+https://github.com/eddic/fastcgipp.git")

sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${_pkgname}" \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

test() {
    ctest --test-dir build
}
