pkgname=cpuinf-git
pkgver=r3.36ab133
pkgrel=1
pkgdesc="tiny CPU-Z clone for x86 linux"
arch=('x86_64')
url="https://github.com/Naharashu/cpuinf"
license=('MIT')
depends=('glibc' 'cpuinfo' 'cairo' 'fltk' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/Naharashu/cpuinf.git")
md5sums=('SKIP')
options=('!debug')

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
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"  
}
