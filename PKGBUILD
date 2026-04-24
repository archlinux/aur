# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Christopher Reimer <c.reimer1993@gmail.com>
pkgname=texmacs
pkgver=2.1.5
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs"
arch=(x86_64)
url="https://www.${pkgname}.org"
license=(GPL-3.0-or-later)
# do not remove texlive-basic dependency, as it is needed!
depends=(freetype2 guile1.8 libxext perl python qt5-svg texlive-basic)
makedepends=(ghostscript cmake)
optdepends=('fig2dev: convert images using fig2ps'
  'gawk: conversion of some files'
  'ghostscript: rendering ps files'
  'imagemagick: convert images'
  'aspell: spell checking')
source=(${url}/Download/ftp/tmftp/source/TeXmacs-${pkgver}-src.tar.gz)
options=('!emptydirs')
sha512sums=('baff6fbfec3cc08bd2c0f5d340f584895f29dc58059f7437edf1bb2537a94b7be0035715ff8fa2c1a36ab8a9adc5b6f0673651eba4da6ef8598281ed0a277389')

build() {
  cmake \
    -S TeXmacs-${pkgver}.15315 \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 TeXmacs-${pkgver}.15315/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
