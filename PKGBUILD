# $Id: PKGBUILD 273634 2017-12-10 21:50:40Z arojas $
# Maintainer: Paul Wilk <paul.wilk@null.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: Mikko Seppдlд <t-r-a-y@mbnet.fi>

pkgname=xvkbd
pkgver=3.8
pkgrel=1
pkgdesc="virtual (graphical) keyboard program for X Window System"
arch=('x86_64')
url="http://t-sato.in.coocan.jp/xvkbd/"
license=('GPL')
depends=('libxmu' 'xaw3d' 'glibc' 'libxt' 'libxtst' 'libxp' 'libxpm')
makedepends=('imake')
source=(http://t-sato.in.coocan.jp/xvkbd/xvkbd-$pkgver.tar.gz)
sha256sums=('2ca43d4f2eebd66aef7c89a17e019146f14ccfe85c731a818202a85fd6e2259b')

build() {
  cd $pkgname-$pkgver
  xmkmf
  sed -i 's|#include <X11/Xaw/|#include <X11/Xaw3d/|' xvkbd.c
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # fix
  rm -f "$pkgdir"/usr/lib/X11/app-defaults
  mkdir -p "$pkgdir"/usr/lib/X11
  mv "$pkgdir"/etc/X11/app-defaults "$pkgdir"/usr/lib/X11/
  rm -rf "$pkgdir"/etc/
}
