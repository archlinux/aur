# Maintainer: JohnyPea <johnypean@gmail.com>

pkgname=kwin-effect-shaders-git
_pkgname=kwin-effect-shaders
pkgver=159.ref9f7e8
pkgrel=1
pkgdesc="KDE Plasma / KWin desktop effect aimed at adding post processing effects to video games."
arch=('i686' 'x86_64')
url="https://github.com/kevinlekiller/kwin-effect-shaders"
license=('GPL')
depends=('kwin') #kf5
makedepends=('extra-cmake-modules')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=('git+https://github.com/kevinlekiller/kwin-effect-shaders')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local srcversion="$(grep "ID_GUAYADEQUE_VERSION" src/Version.h.in | cut -d '"' -f 2)"
  printf "%s.r%s" $srcversion "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir build
  cd build
  cmake ..
}

build() {
  cd "${srcdir}/${_pkgname}/build"
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
