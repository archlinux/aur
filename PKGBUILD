# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=libetc
pkgver=0.4
pkgrel=4
pkgdesc="Automatically translate ~/.* to ~/.config/*"
arch=(i686 x86_64)
url="http://ordiluc.net/fs/libetc/"
license=(GPL3)
makedepends=('make')
install=libetc.install
source=('http://ordiluc.net/fs/libetc/libetc-0.4.tar.gz'
        'libetc-0.4-makefile.patch'
        'libetc-0.4-firefox35.patch')
md5sums=('d72901834a7246c871f5985a30940f4c'
         '9c06072dc4d817db25a6c83fe3071e8a'
         'fbe2dce5013d5d89b1d75387247618eb')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/libetc-0.4-firefox35.patch"
  patch -p1 -i "$srcdir/libetc-0.4-makefile.patch"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -DXAUTH_HACK" make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
