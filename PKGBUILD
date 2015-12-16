# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=libjpeg6-turbo
pkgver=1.4.2
pkgrel=1
pkgdesc="libjpeg derivative with accelerated baseline JPEG compression and decompression"
arch=('i686' 'x86_64')
url="http://libjpeg-turbo.virtualgl.org/"
license=('BSD')
depends=('glibc')
makedepends=('nasm')
provides=('libjpeg6')
conflicts=('libjpeg6')
options=('!libtool')
source=(http://sourceforge.net/projects/libjpeg-turbo/files/$pkgver/libjpeg-turbo-$pkgver.tar.gz)
md5sums=('86b0d5f7507c2e6c21c00219162c3c44')

build() {
  cd "$srcdir/libjpeg-turbo-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/libjpeg-turbo-$pkgver"

  make DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir/usr/bin" "$pkgdir/usr/share" "$pkgdir/usr/include"
  rm "$pkgdir/usr/lib/libturbojpeg."{a,so}*
  rm "$pkgdir/usr/lib/libjpeg."{a,so}
}

# vim:set ts=2 sw=2 et:
