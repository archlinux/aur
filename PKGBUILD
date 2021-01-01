# Maintainer: Jelle van der Waa <jelle@archlinux.org

pkgname=libnest2d
pkgver=0.4
pkgrel=1
pkgdesc='2D irregular bin packaging and nesting library written in modern C++'
arch=(x86_64)
url='https://github.com/tamasmeszaros/libnest2d'
license=('LGPL')
depends=(nlopt polyclipping)
makedepends=(boost cmake git)
source=(git+https://github.com/tamasmeszaros/libnest2d#commit=da4782500da4eb8cb6e38e5e3f10164ec5a59778
        allow-disallowed-area.patch::https://patch-diff.githubusercontent.com/raw/tamasmeszaros/libnest2d/pull/18.patch)

prepare() {
  cd ${pkgname}
  # https://github.com/tamasmeszaros/libnest2d/pull/18
  patch -Np1 -i ${srcdir}/allow-disallowed-area.patch

  mkdir build
}

build() {
  cd ${pkgname}/build
  cmake .. -DLIBNEST2D_HEADER_ONLY=OFF -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd ${pkgname}/build
  make DESTDIR="${pkgdir}" install
}
