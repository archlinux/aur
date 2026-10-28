pkgname=cpuinf-git
pkgver=r1.6dedcdc
pkgrel=1
pkgdesc="tiny CPU-Z clone for x86 linux"
arch=('x86_64')
url="https://github.com/Naharashu/cpuinf"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake' 'ninja' 'mold' 'cpuinfo' 'fltk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("cpuinf-git::git+ssh://git@github.com/Naharashu/cpuinf.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${pkgname}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
