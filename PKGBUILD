# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Christopher Reimer <c.reimer1993@gmail.com>

pkgname=texmacs
pkgver=2.1.2
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor TeX-fonts and CAS-interface (Giac, GTybalt, Macaulay 2, Maxima, Octave, Pari, Qcl, R and Yacas) in one."
arch=('x86_64')
url="http://www.${pkgname}.org"
license=('GPL')
depends=('perl' 'guile1.8' 'texlive-core' 'python' 'libxext' 'freetype2' 'qt5-svg')
# do not remove texlive-core dependency, as it is needed!
optdepends=('transfig: convert images using fig2ps'
  'gawk: conversion of some files'
  'ghostscript: rendering ps files'
  'imagemagick: convert images'
  'aspell: spell checking')
makedepends=('ghostscript' 'cmake')
source=(${url}/Download/ftp/tmftp/source/TeXmacs-${pkgver}-src.tar.gz)
options=('!emptydirs')
sha512sums=('8fef84acd60d53a0904fd722dc1ccc027975a769006a3433ccdc723479f22a60c0abfeba071d73f1a12c42e7a80dcf08eae3203e9df75780120d6db899ea6fa4')

build() {
  cmake \
    -S TeXmacs-${pkgver}-src \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
