# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.71
pkgrel=1
pkgdesc="Qt 4 based UNIX MAME frontend supporting SDLMAME"
url="http://qmc2.batcom-it.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('qt5-webkit' 'qt5-svg' 'qt5-multimedia' 'phonon-qt5' 'sdl')
makedepends=('rsync' 'mesa')
source=("http://downloads.sourceforge.net/project/qmc2/qmc2/$pkgver/qmc2-$pkgver.tar.bz2")
sha256sums=('4233d8aaf679f9f752348990eb5ebe3ab801e28a17dc624ba9b6eb77d54a82f0')

build() {
  cd "$srcdir/$pkgname"
  export CTIME=0
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  install -D -m644 "$srcdir/qmc2/data/img/mame.png" "$pkgdir/usr/share/pixmaps"
}
