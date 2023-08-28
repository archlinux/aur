# Maintainer: Christopher Goldberg

pkgname=minitube-systray
_pkgname=minitube
pkgver=3.9.3
pkgrel=2
pkgdesc="A YouTube desktop application (player) with systray functionality"
arch=(x86_64)
url="https://github.com/chrisgoldberg1/minitube"
license=(GPL3)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(gcc-libs glibc qt5-base qt5-declarative qt5-x11extras)
makedepends=(mpv qt5-tools)
source=("https://github.com/chrisgoldberg1/${_pkgname}/releases/download/v$pkgver-systray$pkgrel/${_pkgname}-$pkgver-systray$pkgrel.tar.bz2")

sha512sums=("2de0b1ea933534b7dbec1944ef37df01a8be709abf347f0f266a5e6ad8c64df2461c74774ced30fd57ceba69f9f3f52540765bc3ccc019a83b8c12d1a8781557")
b2sums=("787713b0f57940fabc224daf4894e392b626e83629a7a36da278463f02579eb06991e8c62b4699c0c35fb2a5875af5b2f86cb14f430665cbf8f1c2b300629952")

build() {
  cd ${_pkgname}-$pkgver
  qmake
}

package() {
  depends+=(libmpv.so)

  make install INSTALL_ROOT="$pkgdir/" -C ${_pkgname}-$pkgver
  install -vDm 644 ${_pkgname}-$pkgver/{AUTHORS,CHANGES,README.md,TODO} -t "$pkgdir/usr/share/doc/${_pkgname}/"
}
