# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=wxmp3val-git
_pkgname="${pkgname%-git}"
pkgver=r219.0016161
pkgrel=1
pkgdesc="a free front-end for the MP3val"
url="https://github.com/cfgnunes/wxmp3val"
depends=(mp3val wxwidgets-gtk3)
makedepends=(git cmake)
license=('GPL')
arch=('x86_64')
source=("${pkgname}"::'git+https://github.com/cfgnunes/wxmp3val.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  [ -d build ] && rm -r build
  mkdir build
  cd build
  cmake ..
  cmake --build .
}

package() {
  cd ${srcdir}/${pkgname}/build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -P cmake_install.cmake 
  mv "${pkgdir}/usr/bin/wxmp3val" "${pkgdir}/usr/share/${_pkgname}/wxmp3val"
  ln -s "/usr/share/${_pkgname}/wxmp3val" "${pkgdir}/usr/bin/wxmp3val"
}

# vim:set ts=2 sw=2 et:
