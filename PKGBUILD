# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=zita-ajbridge
pkgver=0.4.0
pkgrel=2

pkgdesc="Allow to use an ALSA device as a Jack client."
url="http://kokkinizita.linuxaudio.org/linuxaudio/zita-ajbridge-doc/quickguide.html"
arch=(i686 x86_64)
license=('GPL3')

depends=('jack' 'zita-resampler' 'zita-alsa-pcmi')

source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('9b834537b26063cc9ea6990cadeef62d')

prepare() {
  cd $pkgname-$pkgver/source
  sed -i 's/15/1/' jackclient.cc
}

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  # readme
  install -Dm644 ../README \
    "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
