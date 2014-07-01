# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=dbus-sharp-glib
pkgver=0.5.0
pkgrel=5
pkgdesc="C# GLib implementation of D-Bus"
arch=('any')
url="http://github.com/mono/dbus-sharp/"
license=('custom')
depends=('dbus-sharp>=0.7')
makedepends=('pkgconfig')
options=(!makeflags)
source=(https://github.com/downloads/mono/dbus-sharp/$pkgname-$pkgver.tar.gz)
md5sums=('2284293316eb3a89f0f78798b8a24418')

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
