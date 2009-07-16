# $Id: PKGBUILD,v 1.10 2009/04/24 15:22:24 sergej Exp $
# Maintainer: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.2.b8
pkgrel=1
pkgdesc="Qt 4 based UNIX MAME frontend supporting SDLMAME."
url="http://www.mameworld.net/mamecat/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('qt' 'phonon')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        'qmamecat.desktop')
md5sums=('a15d454be8b5a70ed3e6c39b0c03cba4'
         'bf2a7898e6fff196fb99b5bcc4128a79')

build() {
  cd "$srcdir/$pkgname"

  export CTIME=0

  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr || return 1
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr DESTDIR=$pkgdir install || return 1

  mkdir -p $pkgdir/usr/share/{applications,pixmaps}

  install -D -m644 "$srcdir/qmamecat.desktop" "$pkgdir/usr/share/applications" && \
  install -D -m644 "$srcdir/qmc2/data/img/mame.png" "$pkgdir/usr/share/pixmaps"
}
