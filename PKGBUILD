# Maintainer: Arondight <shell_way@foxmail.com>

pkgname='sudodev-git'
pkgver='v0.28.r0.gac970ce'
pkgrel=1
pkgdesc='Create your special device for a none-password sudo'
arch=('any')
url='https://github.com/Arondight/sudodev.git'
license=('GPL')
groups=()
depends=('sudo')
makedepends=('git' 'cmake' 'make')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}#tag=v0.28")
noextract=()
sha256sums=('SKIP')

builddir='build'

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  \
    || printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  mkdir -p $builddir
  cd $builddir
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/"
  cmake --build . --config Release -- -j4
}

check() {
  cd "${srcdir}/${pkgname%-git}"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  cd $builddir
  make install
}

