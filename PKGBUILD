# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdl2trs
_pkgname=sdltrs
pkgver=1.2.12
_commit=bdf97932
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator (with hardware rendering support)"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
source=("$url/-/archive/$_commit/sdltrs-$_commit.tar.gz")
sha512sums=('SKIP')

build() {
  cd $_pkgname-$_commit
  ./autogen.sh
  ./configure --enable-readline --enable-zbx --prefix=/usr
  make
}

package() {
  cd $_pkgname-$_commit
  make DESTDIR="$pkgdir/" install

  install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$_pkgname-$_commit/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
