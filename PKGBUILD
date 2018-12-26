
pkgname=gpupad-git
_pkgname=gpupad
pkgver=latest
pkgrel=3
pkgdesc='A text editor for efficiently editing GLSL shaders of all kinds.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/houmaster/gpupad"
license=('GPL3')
depends=('qt5-declarative')
makedepends=('cmake' 'git')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=('git+https://github.com/houmaster/gpupad.git')
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  echo "\"${pkgver}\"" > "src/_version.h"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
