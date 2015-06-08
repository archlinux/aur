# Maintainer: Volker Schatz <rot13: nepu@ibyxrefpungm.pbz> (try tr a-z n-za-m)
# Contributor: Marko Turk <marko.c4@gmail.com>
pkgname=dog
pkgver=1.7
pkgrel=3
pkgdesc="A better cat, supporting HTTP and hex dumping"
url="http://packages.debian.org/sid/dog"
arch=('i686' 'x86_64')
license=('GPL')
source=(
"http://archive.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.orig.tar.gz"
"http://archive.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver-10.diff.gz")
md5sums=('c93a8aa17c5e75ea1d32cd897b0f838e'
         '18d77b7d0046dc8c14d5d08c9f067c79')

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  zcat "../${pkgname}_$pkgver-10.diff.gz" | patch -p1
  cat debian/patches/{0[0-9],1}* | patch -p1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  install -m 755 -D dog "$pkgdir"/usr/bin/dog
  install -m 644 -D dog.1 "$pkgdir"/usr/man/man1/dog.1
}

# vim:set ts=2 sw=2 et:
