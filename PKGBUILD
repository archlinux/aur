# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.9.3
pkgrel=3
pkgdesc="A YouTube desktop application"
arch=(x86_64)
url="https://flavio.tordini.org/minitube"
license=('GPL-3.0-only')
depends=(gcc-libs glibc qt5-base qt5-declarative qt5-x11extras)
makedepends=(mpv qt5-tools)
source=(
  "https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
  "${pkgname}-3.9.3-mpv_0.35.patch"
)
sha512sums=('6cae7e5a3d03678ccf09d9c25e66f31d8e447defd956611cb0af1edeb953c283ccffbfae159db0fceafe16066fa02a07df66d966ee4172018b10c765034f3b81'
            '5fba6410a317d23e00f8372c1823df28a329990328ff9aa5bbb802985e57c4b95f96d41bb949e32804b7053f38a3f14b1cb79f8b5a5a49ff3236a31d07c308b9')
b2sums=('cfad747bdae5dbbdc89dfb5dba341f3c443e8c1da6030db9a08ed6dbfde163a3ff79f7a3ebb4ec1d2e0892d037d21b234a2e82676aac9c5a1562fd814cd9b22d'
        '610c3c455042ddf81fdafa2ce28e0d4e4049d7ce4e533490e77e12a1e2d15f6b305d51eec261e88986d39388fc278230c137a5b358a74448b586e2e5eef2c213')

prepare() {
  # fix build against mpv >= 0.35: https://github.com/flaviotordini/minitube/issues/217
  patch -Np1 -d "${pkgname}-${pkgver}" -i "../${pkgname}-3.9.3-mpv_0.35.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  qmake
}

package() {
  depends+=(libmpv.so)

  make install INSTALL_ROOT="${pkgdir}/" -C "${pkgname}-${pkgver}"
  install -vDm 644 "${pkgname}-${pkgver}"/{AUTHORS,CHANGES,README.md,TODO} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
