# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=fastcgi++-git
_pkgname=fastcgipp
pkgver=3.0.r88.g02ca540
pkgrel=1
pkgdesc="This library is intended as a high-efficiency C++14 api for web development."
arch=('x86_64')
url="https://fastcgipp.isatec.ca"
_url="https://github.com/eddic/fastcgipp"
license=('LGPL')
depends=()
makedepends=('git')
conflicts=('fastcgi++')

source=("git+$_url.git")

sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    rm -Rf build
    mkdir build
    cd build
    cmake ../$_pkgname \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

build() {
    cd build
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}

test() {
    cd build
    make tests
    make test
}
