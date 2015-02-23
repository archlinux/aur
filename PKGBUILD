# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=dbus-sharp-glib
pkgver=0.6.0
pkgrel=1
pkgdesc="C# GLib implementation of D-Bus"
arch=('any')
url="http://github.com/mono/dbus-sharp-glib/"
license=('custom')
depends=('dbus-sharp>=0.8')
makedepends=('pkgconfig')
options=(!makeflags)
source=(https://github.com/mono/$pkgname/releases/download/v${pkgver:0:3}/$pkgname-$pkgver.tar.gz)
md5sums=('398475a4ed7793eb587c4f0eb913bb7f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
