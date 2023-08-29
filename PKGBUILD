# Maintainer: Christopher Goldberg

pkgname=minitube-systray-git
_pkgname=minitube
pkgver=3.9.3
pkgrel=4
pkgdesc="A YouTube desktop application (player) with systray functionality"
arch=(x86_64)
url="https://github.com/chrisgoldberg1/minitube"
license=(GPL3)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(gcc-libs glibc qt5-base qt5-declarative qt5-x11extras)
makedepends=(mpv qt5-tools)
source=("git+https://github.com/chrisgoldberg1/minitube.git")

sha512sums=("SKIP")

build() {
  cd "$srcdir/${_pkgname}"
  git submodule update --init --recursive
  qmake
}

package() {
  depends+=(libmpv.so)

  make install INSTALL_ROOT="$pkgdir/" -C ${_pkgname}
  install -vDm 644 ${_pkgname}/{AUTHORS,CHANGES,README.md,TODO} -t "$pkgdir/usr/share/doc/${_pkgname}/"
}
