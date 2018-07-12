# Maintainer: wchurch58

pkgname=vita3k-emu-fresh
pkgver=r11
pkgrel=1
pkgdesc='PlayStation Vita emulator'
arch=('i686' 'x86_64')
url='http://www.github.com/vita3k/vita3k'
license=('GPL2')
depends=('unicorn' 'sdl2')
makedepends=('git' 'cmake' 'yaml-cpp' 'capstone' 'gmock' 'gtest' 'glbinding' 'libnids')
source=('vita3k::git+https://github.com/vita3k/vita3k.git')
sha256sums=('SKIP')

build() {

mkdir -p vita3k/build
cd vita3k

git submodule update --init --recursive
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
make -j1
}

package() {
cd vita3k/build

make DESTDIR="${pkgdir}" install

install -D -m755 "bin/Vita3K" "${pkgdir}/usr/bin/vita3k"
}
