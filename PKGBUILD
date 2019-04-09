# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: andrewski

pkgname=gl-117
pkgver=1.3.2
pkgrel=9
pkgdesc="An action flight simulator"
arch=('x86_64')
url="http://www.heptargon.de/gl-117/gl-117.html"
license=("GPL")
depends=('freeglut' 'sdl_mixer' 'libxmu' 'libxi' 'glu')
source=(https://downloads.sourceforge.net/project/gl-117/gl-117/GL-117%20Source/gl-117-$pkgver-src.tar.bz2
	gl-117.desktop
	gl-117.png)
sha256sums=('64bd0190a102725c76eba4983a5d79a0979ec42a087c56c8025b461f6e0e6ffb'
            '75f12e04a9052716072cde4e7ceec70d169389362fadd763c3e7ed39165c93a2'
            '85ac57f7f501cb7138cd9669c90c76295e73ee5c624233d80850b930e6aab6b5')

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
