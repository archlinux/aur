# Maintainer: Victor Perevozchikov webmaster@victor3d.com.br
pkgname=executor-git
pkgver=r1224.a7451c9f
pkgrel=1
pkgdesc='Old-school Macintosh Emulator'
arch=('x86_64')
url="https://github.com/autc04/executor"
license=('MIT')
depends=("qt5-base" "boost" "executor-data")
makedepends=("cmake" "sdl2" "boost" "git" "ruby" "bison" "perl")
source=('git+https://github.com/autc04/executor')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/executor"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/executor"
  git submodule init
  git submodule update
}

build() {
        cd "${srcdir}/executor"
        mkdir build
        cd build
        cmake ..
        cmake --build .
}

package() {
  install -Dm755 "${srcdir}/executor/build/executor" "${pkgdir}/usr/bin/executor"
  install -Dm755 "${srcdir}/executor/build/executor-x" "${pkgdir}/usr/bin/executor-x"
  install -Dm755 "${srcdir}/executor/build/executor-sdl2" "${pkgdir}/usr/bin/executor-sdl2"
}
