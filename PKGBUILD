# Maintainer: sharafat <sharafat two thousand four at gmail>

pkgname=kate-wakatime-git
pkgver=1.3.10.r1.g3c03b34
pkgrel=1
pkgdesc="Kate plugin to interface with WakaTime"
arch=('x86_64')
url="https://tatsh.github.io/kate-wakatime/"
license=('GPL3')
depends=('kate')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('kate-wakatime')
conflicts=('kate-wakatime')
source=("git+https://github.com/Tatsh/kate-wakatime.git")
md5sums=('SKIP')

pkgver() {
  cd "kate-wakatime"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "kate-wakatime" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
