# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=superderpy-git
pkgver=0.1a.r76.g5f5b685
pkgrel=1
pkgdesc="A My Little Pony themed arcade game with famous Derpy Hooves as main hero"
arch=('x86_64')
url='https://superderpy.com/'
license=('GPL-2.0-or-later')
conflicts=('superderpy')
provides=('superderpy')
depends=('allegro')
makedepends=('cmake' 'git')
source=(git+https://github.com/dos1/SuperDerpy)
sha256sums=('SKIP')

pkgver() {
  cd SuperDerpy
  git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cmake -B build -S SuperDerpy -DCMAKE_INSTALL_PREFIX="/usr"  -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
