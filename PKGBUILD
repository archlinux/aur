# Maintainer: Remi Gacogne <rgacogne-arch at coredump dot fr>
pkgname=sslscan
pkgver=1.10.2
pkgrel=1
pkgdesc="A fast tools to scan SSL services, such as HTTPS."
arch=('i686' 'x86_64')
url="https://github.com/DinoTools/sslscan/"
license=('GPL3')
depends=('openssl')
source=(https://github.com/DinoTools/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('b7bf9a12c0469893bf1ada53f42cf0a7c286d6bcb5db260ea0ecd6c332ccb8ec6caafa07cd78d15582af5d154b6f4c84cee55ba2fe5a286cb9bd3f9c83e60c34')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS="${LDFLAGS} -lssl -lcrypto" make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  make BINPATH="$pkgdir/usr/bin/" MANPATH="$pkgdir/usr/share/man/" install
}
