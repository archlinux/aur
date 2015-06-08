# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_pkgname=asoundpp
pkgname=asoundpp-git
pkgver=r71.d91e378
pkgrel=1
pkgdesc="ALSA C++ wrapper library"
arch=('i686' 'x86_64')
url="https://github.com/sorokin/asoundpp"
license=('unknown')
depends=('alsa-lib' 'speex' 'boost')
makedepends=('cmake')

source=('asoundpp::git+git://github.com/sorokin/asoundpp.git'
        'cmake.patch')
md5sums=('SKIP'
         'c974a82dc98fe4c3a47fe74f82685c9a')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git apply ../cmake.patch
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX:PATH=/usr -Wno-dev
}

build() {
    cd "$_pkgname"/build
    make
}

package() {
    cd "$_pkgname"/build
    make DESTDIR="${pkgdir}" install
}

