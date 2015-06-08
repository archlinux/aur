# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=libsquish
pkgver=1.11
pkgrel=2
pkgdesc="DXT compression library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libsquish"
license=('MIT')
options=(staticlibs)
source=(http://libsquish.googlecode.com/files/squish-$pkgver.zip
        gcc440.patch
        config
        LICENSE)
sha1sums=('1fdff1ba72a002900c877baebcf0aeab9af4922b'
          '51bcc11eafbf79d9cde24769397c7a42f886154a'
          'db587e6251b850820d7ce6edaf8eccb180c24b99'
          'e285c60d401f91f282de6ad6b6f549e9f5e9ff1d')

prepare() {
  cd "$srcdir/squish-$pkgver"
  cp $srcdir/config .

  patch -Np0 -i $srcdir/gcc440.patch
}

build() {
  cd "$srcdir/squish-$pkgver"

  make || return 1
}

package() {
  cd "$srcdir/squish-$pkgver"

  mkdir -p $pkgdir/usr/{include,lib}

  install -Dm 644 squish.h $pkgdir/usr/include/squish.h
  install -Dm 644 libsquish.a $pkgdir/usr/lib/libsquish.a

  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
