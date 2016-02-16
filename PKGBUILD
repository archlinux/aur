# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-git
pkgver=r436.dd8a661
pkgrel=1
url=''
arch=('i686' 'x86_64')
license=('MIT')
source=('git+https://github.com/KhronosGroup/SPIRV-Tools')
sha1sums=('SKIP')
makedepends=('cmake')
options=('staticlibs')

pkgver() {
  cd "${srcdir}"/SPIRV-Tools
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/SPIRV-Tools
  cmake -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/SPIRV-Tools

  # Tools
  install -dm755                   "${pkgdir}"/usr/bin/
  install -m755 spirv-{as,dis,val} "${pkgdir}"/usr/bin/

  # Library
  install -dm755    "${pkgdir}"/usr/lib/
  install -m644 *.a "${pkgdir}"/usr/lib/

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
