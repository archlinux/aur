# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=zita-ajbridge
pkgver=0.6.0
pkgrel=2

pkgdesc="Jack client to use additional ALSA devices."
url="http://kokkinizita.linuxaudio.org/linuxaudio/zita-ajbridge-doc/quickguide.html"
arch=(i686 x86_64)
license=('GPL3')

depends=('jack' 'zita-resampler' 'zita-alsa-pcmi')

source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
sha256sums=('f8a690fbcead95150aa55f065694c6d5cae285c9c98421fc91809e603446450c')

build() {
  cd "$pkgname-$pkgver"/source
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"/source

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"
  
  install -m 755 zita-a2j "$pkgdir"/usr/bin 
  install -m 755 zita-j2a "$pkgdir"/usr/bin
  install -m 644 zita-ajbridge.1.gz "$pkgdir"/usr/share/man/man1
  install -m 644 zita-a2j.1.gz "$pkgdir"/usr/share/man/man1
  install -m 644 zita-j2a.1.gz "$pkgdir"/usr/share/man/man1
  install -m644 ../README "$pkgdir"/usr/share/doc/"$pkgname"
}
# vim:set ts=2 sw=2 et:
