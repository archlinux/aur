# Maintainer: Sanjay Pavan <withercubes@protonmail.com>

pkgname=nsxiv
_pkgname=nsxiv
pkgver=29
pkgrel=2
pkgdesc='Neo (or New or Not) Simple (or Small or Suckless) X Image Viewer'
arch=('x86_64')
license=('GPL2')
conflicts=('nsxiv-git')
url='https://github.com/nsxiv/nsxiv'
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'libxft' 'giflib' 'libwebp')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/nsxiv/nsxiv/archive/v$pkgver.tar.gz")
sha256sums=('564a17d921172336f7cd463bf313e39f84e4bcf4fdc789326f4112f848aad039')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  ln -s config.def.h config.h
  sed -i -e '/^install: / s|: all|:|' Makefile
}

build() {
  make -C "$_pkgname-$pkgver"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install-all
}
