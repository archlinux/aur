_pkgname=corekeyboard
pkgname=${_pkgname}-git
pkgver=4.5.0.r2.g18e755d
pkgrel=1
pkgdesc="A x11 based virtual keyboard from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime-git' 'qt5-x11extras' 'libxtst' 'libx11')
makedepends=('git' 'cmake' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('coreapps-git')
source=("git+https://gitlab.com/cubocore/coreapps/corekeyboard.git")
md5sums=('SKIP')


pkgver() {
  cd ${_pkgname}
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname} \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}
