# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christopher Rogers <slaxemulator@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com> 

pkgname=wordwarvi
pkgver=1.00
pkgrel=2
pkgdesc="Side-scrolling shoot 'em up '80s style arcade game"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net"
license=('GPL2' 'custom')
depends=('gtk2' 'portaudio')
install=$pkgname.install
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('034a908346a2ab514f92b12f5e952b80'
         'ab6a905ec749940057a3816a833f103b')

prepare() {
  cd $pkgname-$pkgver
  sed -i "s,sounds/,/usr/share/$pkgname/sounds/," $pkgname.c
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 sounds/Attribution.txt $pkgdir/usr/share/licenses/$pkgname/COPYING_SOUNDS
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 icons/wordwarvi_icon_48x48.png $pkgdir/usr/share/pixmaps/$pkgname.png

  for _width in '16' '22' '32' '48' '64' '128'; do
    install -Dm644 icons/${pkgname}_icon_${_width}x${_width}.png \
      $pkgdir/usr/share/icons/hicolor/${_width}x${_width}/apps/$pkgname.png
  done
}