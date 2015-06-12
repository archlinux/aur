# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bethewumpus
pkgver=0.05
pkgrel=4
pkgdesc="a game with no graphics, with no text, only audio"
arch=('i686' 'x86_64')
url="http://bethewumpus.sourceforge.net/"
license=('GPL-2')
depends=('portaudio' 'libvorbis' 'gtk2')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/betheuwumpus-0.05/${pkgname}-${pkgver}.tar.gz" "bethewumpus.png" "bethewumpus.desktop")
md5sums=('b99f8eed9f654313f1e33baf15c5c1e7'
         '8a71fccd029ac49a4f903b3b79f0301c'
         '10e1ba8b71e7e808404578fd05f83e0a')
build() {
true
}

package() {
  mkdir -p $pkgdir/usr/{bin,share/bethewumpus/sounds}
  cd $srcdir/$pkgname-$pkgver
  make
  install -D -m755 ./bethewumpus $pkgdir/usr/share/bethewumpus/bethewumpus
  install -D -m644 ./sounds/* $pkgdir/usr/share/bethewumpus/sounds
  gzip -f bethewumpus.6
  install -D -m644 bethewumpus.6.gz $pkgdir/usr/share/man/man6/bethewumpus.6.gz
  echo "#!/bin/sh
cd /usr/share/bethewumpus
./bethewumpus \"\$@\"" > $pkgdir/usr/bin/bethewumpus
  chmod 755 $pkgdir/usr/bin/bethewumpus
  install -D -m644 $srcdir/bethewumpus.png $pkgdir/usr/share/pixmaps/bethewumpus.png && \
  install -D -m644 $srcdir/bethewumpus.desktop $pkgdir/usr/share/applications/bethewumpus.desktop
}
