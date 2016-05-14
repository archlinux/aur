# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libident
pkgver=0.32
pkgrel=6
pkgdesc='Library for querying IDENT servers'
arch=('x86_64' 'i686')
url='http://www.remlab.net/libident/'
license=('custom')
depends=('glibc')
options=('!emptydirs')
source=("http://www.remlab.net/files/libident/libident-$pkgver.tar.gz"
        'libident.pc')
sha256sums=('8cc8fb69f1c888be7cffde7f4caeb3dc6cd0abbc475337683a720aa7638a174b'
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

# vim:set ts=2 sw=2 et:
