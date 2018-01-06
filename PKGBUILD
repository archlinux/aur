# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=fbgetty
pkgver=0.1.698
pkgrel=5
license=("GPL")
pkgdesc="fbgetty is a console getty like mingetty, which supports framebuffers"
arch=('x86_64')
url="http://projects.meuh.org/fbgetty"
source=('http://projects.meuh.org/fbgetty/downloads/fbgetty-'$pkgver'.tar.gz'{,.sig})
sha256sums=('332cbffa7c489b39a7d13d12d581c27dfc57ba098041431a6845b44785cf2d35'
            'SKIP')

build()
{
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man --sbindir=/usr/bin

  patch src/options.c <<EOF
33a34
> #include <stddef.h>
EOF

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/info "$pkgdir"/usr/share/
}
