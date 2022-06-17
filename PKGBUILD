# Maintainer: houmain <houmain@posteo.net>
pkgname=gpupad-git
_pkgname=gpupad
pkgver=latest
pkgrel=5
pkgdesc='A flexible GLSL shader editor and IDE.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/houmain/gpupad"
license=('GPL3')
depends=('qt5-quickcontrols2' 'qt5-multimedia' 'gst-libav')
makedepends=('cmake' 'git')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=('git+https://github.com/houmain/gpupad.git')
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  echo "\"${pkgver}\"" > "src/_version.h"
  cmake -B _build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build _build
}

package() {
  cd "${srcdir}/${_pkgname}/_build"
  make DESTDIR="$pkgdir" install
}
