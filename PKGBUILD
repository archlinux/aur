# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libident
pkgver=0.32
pkgrel=8
pkgdesc='Library for querying IDENT servers'
arch=('x86_64')
url='https://www.remlab.net/libident/'
license=('custom')
options=('!emptydirs')
source=("https://www.remlab.net/files/libident/libident-$pkgver.tar.bz2"
        'libident.pc')
sha256sums=('a88a24adc377322008aaf7bf7078e6d409f5327e9515ce0d755345dd249dce22'
            '81907cda4fe9c925e78bf58bc9c61d1af439784e4f01da4bd6fc7e4d87750f5c')

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm755 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "$srcdir/libident.pc" "$pkgdir/usr/lib/pkgconfig/libident.pc"
}

# vim: ts=2 sw=2 et:
