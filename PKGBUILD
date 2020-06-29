# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdltrs
pkgver=1.2.11
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e803f8a0ddb0e6abffde8b6473282be75b95daeda70de7491283bead8450ce60d86b77367358f8a735c2095d0e9ab08c6b94281a81f77f3780438bfb020c3217')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --enable-readline --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -dm0755 "$pkgdir/usr/share/licenses/sdltrs"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
          -t "$pkgdir/usr/share/licenses/sdltrs"
}
