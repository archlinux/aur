# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=nro-thumbnailer-git
pkgver=0.0.2.r0.gdc57dfc
pkgrel=1
pkgdesc="Thumbnailer for Nintendo Switch homebrew .nro executables (development version)"
arch=('x86_64')
url="https://github.com/carstene1ns/nro-thumbnailer"
license=('custom: ISC')
makedepends=('git' 'freeimage' 'shared-mime-info')
source=("git+https://github.com/carstene1ns/nro-thumbnailer.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  rm -rf build
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname%-*} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
