# Maintainer: archlinux.info:tdy

pkgname=jackbeat
pkgver=0.7.6
pkgrel=1
pkgdesc="An audio sequencer for musicians and sound artists"
arch=(i686 x86_64)
url=http://jackbeat.samalyse.org/about
license=(GPL)
depends=(gtk2 liblo portaudio libpulse)
source=(https://bitbucket.org/olivierg/$pkgname/downloads/$pkgname-$pkgver.tar.gz
        $pkgname.desktop
        $pkgname.xpm)
sha256sums=(bce178a7fd45be5f72607600a0c830d1fc44ecdac772ee4695db2e444a480967
            5844a95ba10d4151c6e0c3debcd55996b4edb6b91545ccb619a806a884dfd9b8
            6bcb5268e996a2205d460c40b9d53e318c70a813667ff5fee8c68bbe32693a8e)

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr LIBS="$(pkg-config --libs gmodule-2.0)"
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  sed -i '18,74d' README
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../$pkgname.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm
}
