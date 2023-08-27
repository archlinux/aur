# Maintainer: Christopher Goldberg

pkgname=minitube-systray
_pkgname=minitube
pkgver=3.9.3
pkgrel=1
pkgdesc="A YouTube desktop application (player) with systray functionality"
arch=(x86_64)
url="https://github.com/chrisgoldberg1/minitube"
license=(GPL3)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(gcc-libs glibc qt5-base qt5-declarative qt5-x11extras)
makedepends=(mpv qt5-tools)
source=("https://github.com/chrisgoldberg1/${_pkgname}/releases/download/v$pkgver-systray/${_pkgname}-$pkgver-systray.tar.bz2")

sha512sums=("a57f3f1688dd9c1bfedd4d6be29643762725e9dce5485dfc6f852ad3ad8fb63771ee77c73df41b06e26da4b48128244c5ea67250411f9949ea64760082594e4f")
b2sums=("1e2d4ba765cacf924da7d9a177c93606b8b1742dd8ec4ddedd54feabdd6d91b165fabb38e1bba3ee122ee75d974e13c437f1c48d53daa229a67ece2b3d32999b")

build() {
	pwd
  cd ${_pkgname}-$pkgver
  qmake
}

package() {
  depends+=(libmpv.so)

  make install INSTALL_ROOT="$pkgdir/" -C ${_pkgname}-$pkgver
  install -vDm 644 ${_pkgname}-$pkgver/{AUTHORS,CHANGES,README.md,TODO} -t "$pkgdir/usr/share/doc/${_pkgname}/"
}
