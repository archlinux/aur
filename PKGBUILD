pkgname=swfdec
pkgver=0.8.4
pkgrel=3
pkgdesc="Free library for decoding and rendering Flash animations"
arch=(i686 x86_64)
url="http://swfdec.freedesktop.org/"
license=(LGPL)
depends=('gtk2>=2.14.6' 'libsoup>=2.24.2.1' 'alsa-lib>=1.0.18' 'liboil>=0.3.15' 'gstreamer0.10-base-plugins>=0.10.15')
makedepends=('gtk-doc>=1.6')
optdepends=('gstreamer0.10-ffmpeg: most common audio/video format for internet flash')
options=(!libtool)
source=(http://swfdec.freedesktop.org/download/$pkgname/0.8/$pkgname-$pkgver.tar.gz
SwfdecPlayer.xml
SwfdecAsFunction.xml
)
md5sums=(aece501d0e73f3e564200a44ec03c385
'SKIP'
'SKIP'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --enable-gtk --enable-gstreamer --enable-gtk-doc \
              --with-audio=alsa

  make || true
  /bin/cp -f -t ./doc/xml/ ../SwfdecAsFunction.xml ../SwfdecPlayer.xml
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
