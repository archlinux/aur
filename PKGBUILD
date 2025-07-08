# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=torcs
pkgver=1.3.8
pkgrel=1
pkgdesc="A 3D racing cars simulator using OpenGL"
url="http://torcs.sourceforge.net"
license=("GPL")
arch=('x86_64' 'i686')
depends=('freeglut' 'libpng' 'freealut' 'libxi' 'libxmu' 'libxrandr' 'libvorbis' 'glu' "torcs-data=$pkgver")
makedepends=('plib' 'mesa')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-${pkgver/_/-}.tar.bz2
        format-argument.patch.gz)
md5sums=('45261f9d1a66fc46f1735d57fad97ed5'
         '64216e9dba6cc030c38cde8efea3e59d'
         'e84edaa1660f55fd980136f70e6471e6'
         '626695efb84fb1a4d59dc8be4ac9c047')

prepare() {
  cd "$srcdir"/$pkgname-${pkgver/_/-}
  gunzip -c $srcdir/format-argument.patch.gz | patch -p1
}

build() {
  cd "$srcdir"/$pkgname-${pkgver/_/-}
  unset LDFLAGS
  ./configure --prefix=/usr --x-includes=/usr/include --x-libraries=/usr/lib
  make
}

package() {
  cd "$srcdir"/$pkgname-${pkgver/_/-}
  make DESTDIR="$pkgdir" install
  install -D -m644 Ticon.png "$pkgdir"/usr/share/pixmaps/torcs.png
  install -D -m644 torcs.desktop "$pkgdir"/usr/share/applications/torcs.desktop
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
