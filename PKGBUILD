# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Christopher Reimer <c.reimer1993@gmail.com>
pkgname=texmacs
pkgver=2.1.4
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
sha512sums=('8c6e4a47bf09f9bbe260e413e9d38229e2ca600cfb03e34766dd2860ce85b8187fbbee4197bf9b1c8ff3dcc21fe00c205552a04afeb40b0708723e484f57aad2')

build() {
  cmake \
    -S TeXmacs \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 TeXmacs/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
