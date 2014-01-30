# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.42
pkgrel=1
pkgdesc="Qt 4 based UNIX MAME frontend supporting SDLMAME"
url="http://qmc2.arcadehits.net"
license=("GPL")
arch=('i686' 'x86_64')
depends=('qtwebkit' 'phonon' 'sdl')
makedepends=('rsync' 'mesa')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-$pkgver.tar.bz2")
md5sums=('516f333848948c16460060e314e6befb')

build() {
  cd "$srcdir/$pkgname"
  export CTIME=0
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt4
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt4 DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/{applications,pixmaps}
  install -D -m644 "$srcdir/qmc2/data/img/mame.png" "$pkgdir/usr/share/pixmaps"
}
