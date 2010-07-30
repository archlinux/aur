# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.2.b16
pkgrel=1
pkgdesc="Qt 4 based UNIX MAME frontend supporting SDLMAME."
url="http://qmc2.arcadehits.net"
license=("GPL")
arch=('i686' 'x86_64')
depends=('qt' 'phonon' 'sdl' 'libxmu')
makedepends=('rsync' 'mesa')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        'qmamecat.desktop')
md5sums=('e43de45a6a8e07dfea0504264ab19e04'
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
