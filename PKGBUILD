# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdltrs
pkgver=1.2.10
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('176170aaaf2e4af6bce277da7a69bff46ffe8b4769d6bac9f526bca319925bb6df063c6c06be0655239478a86306a8ac2f4cf55446995905280aa027c9148950')

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
