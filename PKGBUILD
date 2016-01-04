# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.59
pkgrel=1
pkgdesc="Qt 4 based UNIX MAME frontend supporting SDLMAME"
url="http://qmc2.batcom-it.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('qtwebkit' 'phonon' 'sdl')
makedepends=('rsync' 'mesa')
source=("http://downloads.sourceforge.net/project/qmc2/qmc2/$pkgver/qmc2-$pkgver.tar.bz2")
md5sums=('172f7203247620f84480fd1caba2ab92')

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
