# Maintainer: James Brink <brink.james@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: James An <james@jamesan.ca>

_pkgname=darling-dmg
pkgname="$_pkgname-git"
pkgver=v1.0.4.r87.g34d3a34
pkgrel=1
pkgdesc="FUSE module for .dmg files (containing an HFS+ filesystem)"
arch=("i686" "x86_64")
url="https://www.darlinghq.org"
license=('GPL3')
depends=("openssl" "bzip2" "libxml2" "fuse2")
makedepends=("git" "cmake" "fuse2" "boost")
provides=("$_pkgname=$pkgver")
source=("git+https://github.com/darlinghq/darling-dmg.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    mkdir -p build
}

build() {
    cd "$_pkgname/build"
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TESTS=1 -DCMAKE_BUILD_TYPE=Release
    make 
}

check() {
    cd "$_pkgname/build"
    make test
}

package() {
    cd "$_pkgname/build"
    make DESTDIR="$pkgdir" install
}
