# Maintainer: n0vember <n0vember at half-9 dot net>
pkgname=thunderbolt-software-user-space
pkgver=cdd7215
pkgrel=1
pkgdesc="Thunderbolt user-space components"
arch=('x86_64')
url="https://github.com/intel/thunderbolt-software-user-space"
license=('BSD-style')
depends=('bash')
makedepends=('cmake'
             'boost'
             'txt2tags')
source=(git+https://github.com/intel/thunderbolt-software-user-space.git)
md5sums=('SKIP')

build() {
  cd "${pkgname}"
  git checkout ${pkgver} -b build
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build .
}

package() {
  cd "${pkgname}/build"
  mkdir -p "${pkgname}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
