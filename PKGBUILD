# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.242
pkgrel=1
pkgdesc='Qt based UNIX MAME frontend supporting SDLMAME'
url='https://qmc2.batcom-it.net/'
license=(GPL)
arch=(x86_64)
depends=(qt5-webkit qt5-svg qt5-multimedia qt5-xmlpatterns sdl2 minizip)
makedepends=(rsync)
source=(https://github.com/qmc2/qmc2-mame-fe/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e4fdd103289d3d09bc8f38ea39e93a81da432705eb50fbd0370e0c4ae2e292c6')

build() {
  cd $pkgname-mame-fe-$pkgver
  export CTIME=0
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 \
    SYSTEM_MINIZIP=1 SYSTEM_ZLIB=1
}

package() {
  cd $pkgname-mame-fe-$pkgver
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt5 DESTDIR="$pkgdir" install
  install -Dm644 data/img/mame.png -t "$pkgdir"/usr/share/pixmaps
}
