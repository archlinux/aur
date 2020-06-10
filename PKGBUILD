# Maintainer: Amiad <aur@hatul.info>
# Contributor: Paul Wilk <paul.wilk@null.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: Mikko Seppдlд <t-r-a-y@mbnet.fi>

pkgname=xvkbd
pkgver=4.1
pkgrel=1
pkgdesc="virtual (graphical) keyboard program for X Window System"
arch=('x86_64')
url="http://t-sato.in.coocan.jp/xvkbd/"
license=('GPL')
depends=('libxmu' 'xaw3d' 'glibc' 'libxt' 'libxtst' 'libxp' 'libxpm')
makedepends=('imake')
source=(http://t-sato.in.coocan.jp/xvkbd/xvkbd-$pkgver.tar.gz)
sha256sums=('952d07df0fe1e45286520b7c98b4fd00fd60dbf3e3e8ff61e12c259f76a3bef4')

build() {
  cd $pkgname-$pkgver
  xmkmf
  sed -i 's|#include <X11/Xaw/|#include <X11/Xaw3d/|' xvkbd.c
  make
}

package() {
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/share/X11
  make DESTDIR="$pkgdir" install
  # fix
  rm -f "$pkgdir"/usr/lib/X11/app-defaults
  mkdir -p "$pkgdir"/usr/lib/X11
  mv "$pkgdir"/etc/X11/app-defaults "$pkgdir"/usr/lib/X11/
  rm -rf "$pkgdir"/etc/
}
