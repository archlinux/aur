# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Immae <ismael.bouya@normalesup.org>
# Contributor: Ray Rashif <schiv@archlinux.org>

_name=WaoN
pkgname=waon
pkgver=0.11
pkgrel=2
pkgdesc="Wave-to-Notes transcriber (WAVE-MIDI converter)"
arch=('i686' 'x86_64')
url="http://waon.sourceforge.net/"
license=('GPL2')
depends=('fftw' 'libsamplerate' 'libao' 'gtk2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kichiki/WaoN/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('20778981b1af9214152e0714f519bbddd8eb49231e6e27790d8aa6c05227142aac560e2a4722c2e0cb3b1c0718889b3c2ad361f400697341bfbe435a4faab585')


prepare() {
  cd "$_name-$pkgver"
  sed -i 's:usr/local:usr:g' Makefile
}

build() {
  cd "$_name-$pkgver"
  make
}

package() {
  cd "$_name-$pkgver"

  install -Dm755 pv $pkgdir/usr/bin/waon-pv
  install -m755 waon gwaon $pkgdir/usr/bin/
  install -Dm644 pv.1 $pkgdir/usr/share/man/man1/waon-pv.1
  install -m644 {waon,gwaon}.1 $pkgdir/usr/share/man/man1/
}
