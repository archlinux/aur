# Maintainer: Zren <zrenfire@gmail.com>

_pkgname=material-kwin-decoration
pkgname=${_pkgname}-git
pkgver=v5+3+gb6c5cdd
pkgrel=1
pkgdesc="Material-ish window decoration theme for KWin, with LIM support."
url='https://github.com/Zren/material-decoration'
arch=('x86_64')
license=('GPL')
depends=('kdecoration')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  make
}


package() {
  cd "${srcdir}/${_pkgname}/build"
  make -C "$srcdir/$_pkgname/build" DESTDIR="$pkgdir" install
}
