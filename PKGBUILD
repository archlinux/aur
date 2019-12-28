# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xrestop-git
pkgver=0.4.r34.19f72d3
pkgrel=2
pkgdesc="Uses the X-Resource extension to provide 'top' like statistics"
arch=('x86_64')
url="http://freedesktop.org/wiki/Software/xrestop"
license=('GPL')
depends=('libxres' 'ncurses')
makedepends=('xorg-util-macros')
source=(git+https://gitlab.freedesktop.org/xorg/app/xrestop)
md5sums=('SKIP')
conflicts=('xrestop')
provides=('xrestop')

pkgver() {
  cd ${pkgname%-git}
  printf "0.4.r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh --prefix=/usr --mandir=/usr/share/man 
  #./configure 
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
