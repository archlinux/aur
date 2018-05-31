# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=dbus-sharp-glib
pkgver=0.6.0
pkgrel=2
pkgdesc="C# GLib implementation of D-Bus"
arch=('any')
url="https://github.com/mono/dbus-sharp-glib/"
license=('custom')
depends=('dbus-sharp>=0.8')
makedepends=('pkgconfig')
options=(!makeflags)
source=(https://github.com/mono/$pkgname/releases/download/v${pkgver:0:3}/$pkgname-$pkgver.tar.gz)
sha256sums=('d5b44d3ffa419730df0a6a6fff1e6912c80bc364e4176444e48264853989ce3b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's/gmcs/mcs/g' -i configure
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
