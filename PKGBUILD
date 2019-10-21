# See AUR interface for current maintainer.
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-mmm-mode  
pkgver=0.5.7
pkgrel=1
pkgdesc="minor mode for Emacs that allows Multiple Major Modes to \
coexist in one buffer"
url="http://mmm-mode.sourceforge.net/"
arch=('any')
provides=('mmm-mode')
conflicts=('mmm-mode')
license=('GPL')
install=mmm-mode.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/purcell/mmm-mode/archive/$pkgver.tar.gz" diacritics.patch)
sha256sums=('f9655542cf91ba766d5fbb9a3ada0c62aaadf96b220969d7c4ec2768a0b53e24'
            'bbab81d4fdf9f0ffdaa4930bbccdd5bc0dc74ecf38cd31e9d6327eb54ae4ae4d')

prepare() {
  cd ${pkgname#emacs-}-$pkgver
  patch -Np1 < "$srcdir"/diacritics.patch
}

build() {
  cd ${pkgname#emacs-}-$pkgver
  mv configure.in configure.ac
  ./autogen.sh
  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}
package() {
  cd ${pkgname#emacs-}-$pkgver
  make DESTDIR="$pkgdir" install
}
