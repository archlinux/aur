# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=zita-lrx
pkgver=0.1.0
pkgrel=1
pkgdesc="A command line jack application providing 2, 3, or 4-band, 4th order crossover filters."
arch=(i686 x86_64)
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL3')
depends=('clthreads>=2.4.0' 'jack')
source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('84c1aa2b8550e0d6771d6c8b5281f986')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/source"

  make PREFIX=/usr DESTDIR="$pkgdir/" install

  # doc
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ../README* \
    "$pkgdir/usr/share/doc/$pkgname"

  # examples
  install -d "$pkgdir/usr/share/$pkgname/examples"
  install -Dm644 ../examples/* \
    "$pkgdir/usr/share/$pkgname/examples"
}

# vim:set ts=2 sw=2 et:
