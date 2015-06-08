# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Original PKGBUILD by: berkus [berkus_at_madfire_dot_net]

pkgname=ocp
pkgver=0.1.21
pkgrel=4
pkgdesc="Open Cubic Player"
arch=('i686' 'x86_64')
url="http://stian.cubic.org/project-ocp.php"
depends=('libsidplay' 'libxxf86vm' 'libvorbis' 'libxpm' 'alsa-lib' 'libmad' 'flac' 'sdl' 'adplug')
makedepends=('texinfo' 'desktop-file-utils')
license=('GPL')
source=(http://sourceforge.net/projects/opencubicplayer/files/ocp-$pkgver/ocp-$pkgver.tar.bz2)
md5sums=('558a6eacfadfd9c60c97a6e9c7f83f47')
install=ocp.install

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1 DESTDIR=$pkgdir
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make -j1 DESTDIR=$pkgdir install
  install -m755 playopl/playopl.so $pkgdir/usr/lib/ocp-0.1.21/playopl.so
  install -m755 playopl/opltype.so $pkgdir/usr/lib/ocp-0.1.21/autoload/30-opltype.so
  rm $pkgdir/usr/share/info/dir
}
