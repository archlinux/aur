# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: andrewski

pkgname=gl-117
pkgver=1.3.2
pkgrel=8
pkgdesc="An action flight simulator"
arch=('x86_64')
url="http://www.heptargon.de/gl-117/gl-117.html"
license=("GPL")
depends=('freeglut' 'sdl_mixer' 'libxmu' 'libxi' 'glu')
source=(http://downloads.sourceforge.net/project/gl-117/gl-117/GL-117%20Source/gl-117-$pkgver-src.tar.bz2
	gl-117.desktop
	gl-117.png)
md5sums=('aad53c5531943529fd769fae4efeae02'
         'db985c5188f1706677b12dc80b797779'
         '6975de5572084b78d3ec1a748de85164')

build() {
  cd "$srcdir"/gl-117-$pkgver-src
  # This will link everything to these three libraries,
  # but it wouldn't work otherwise.  The devs have been contacted.
  LDFLAGS="-lX11 -lXi -lXmu" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/gl-117-$pkgver-src
  make DESTDIR="$pkgdir" install
  install -D -m0644 "$srcdir"/gl-117.desktop "$pkgdir"/usr/share/applications/gl-117.desktop
  install -D -m0644 "$srcdir"/gl-117.png "$pkgdir"/usr/share/pixmaps/gl-117.png
}
