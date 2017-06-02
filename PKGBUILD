# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=libksi
pkgver=3.13.2043
pkgrel=1
pkgdesc="Guardtime KSI C SDK"
arch=('i686' 'x86_64')
url="https://github.com/guardtime/libksi"
license=('Apache')
depends=('curl' 'openssl')
makedepends=('automake' 'gcc')
provides=('libksi')

source=("https://github.com/guardtime/$pkgname/archive/v$pkgver.tar.gz"
        "openssl.1.1.0f.patch")
md5sums=('e0d99dc30db4889a39249fbc76f65459'
         'b9fb84b5a027a948628dfe36046f7b3f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/openssl.1.1.0f.patch"
  autoreconf -i
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
