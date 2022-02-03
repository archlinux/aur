# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.9.3
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=(x86_64)
url="https://flavio.tordini.org/minitube"
license=(GPL3)
depends=(gcc-libs glibc qt5-base qt5-declarative qt5-x11extras)
makedepends=(mpv qt5-tools)
options=(debug)
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('6cae7e5a3d03678ccf09d9c25e66f31d8e447defd956611cb0af1edeb953c283ccffbfae159db0fceafe16066fa02a07df66d966ee4172018b10c765034f3b81')
b2sums=('cfad747bdae5dbbdc89dfb5dba341f3c443e8c1da6030db9a08ed6dbfde163a3ff79f7a3ebb4ec1d2e0892d037d21b234a2e82676aac9c5a1562fd814cd9b22d')

build() {
  cd "${pkgname}-${pkgver}"
  qmake
}

package() {
  depends+=(libmpv.so)

  make install INSTALL_ROOT="${pkgdir}/" -C "${pkgname}-${pkgver}"
  install -vDm 644 "${pkgname}-${pkgver}/"{AUTHORS,CHANGES,README.md,TODO} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
