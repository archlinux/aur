# Maintainer: Sanjay Pavan <withercubes@protonmail.com>

pkgname=nsxiv
_pkgname=nsxiv
pkgver=30
pkgrel=1
pkgdesc='Neo (or New or Not) Simple (or Small or Suckless) X Image Viewer'
arch=('x86_64')
license=('GPL2')
conflicts=('nsxiv-git')
url='https://codeberg.org/nsxiv/nsxiv'
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'libxft' 'giflib' 'libwebp')
source=("$pkgname-$pkgver.tar.gz"::"https://codeberg.org/nsxiv/nsxiv/archive/v$pkgver.tar.gz")
sha256sums=('a916d1385872ccf0b55fbf6b8546d05fcbbbb8b0a92579494e64c6bd22fc7941')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  [ ! -f config.h ] && cp config.def.h config.h
  sed -i -e '/^install: / s|: all|:|' Makefile
}

build() {
  make -C "$_pkgname-$pkgver"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install-all
}
