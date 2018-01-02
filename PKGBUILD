# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.192
pkgrel=1
pkgdesc="Qt based UNIX MAME frontend supporting SDLMAME"
url="http://qmc2.batcom-it.net/"
license=(GPL)
arch=(x86_64)
depends=(qt5-webkit qt5-svg qt5-multimedia sdl2 minizip)
makedepends=(rsync)
source=("http://downloads.sourceforge.net/project/qmc2/qmc2/$pkgver/qmc2-$pkgver.tar.bz2")
sha256sums=('63f89a6839121fef5d5381f7b0baae8ca5e401bf5f32f7d36b36c357e85cee87')

build() {
  cd $pkgname
  export CTIME=0
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 \
    SYSTEM_MINIZIP=1 SYSTEM_ZLIB=1
}

package() {
  cd $pkgname
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  install -D -m644 "$srcdir/qmc2/data/img/mame.png" "$pkgdir/usr/share/pixmaps"
}
