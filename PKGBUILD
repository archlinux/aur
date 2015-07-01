# Contributor: Roberto Salas <ro0xito@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=alltray-scriptable
pkgver=0.70
pkgrel=5
pkgdesc="Drops any app in the tray and waits for a signal to close it"
license=("GPL")
arch=('i686' 'x86_64')
url="http://alltray.sourceforge.net"
depends=('gtk2')
replaces=('alltray')
conflicts=('alltray')
provides=('alltray')
source=(http://downloads.sourceforge.net/sourceforge/alltray/alltray-$pkgver.tar.gz signal.patch)
install="$pkgname.install"

build() {
  # A few dev releases came out after 0.70 but that's it
  cd "$srcdir"/alltray-$pkgver
  patch -p0 ./src/main.c <"$srcdir"/signal.patch
  
  ./configure --prefix=/usr --disable-gconf
  sed -i -e 's/-lglib-2.0/-lglib-2.0 -lX11/g' src/Makefile lib/Makefile
  make
}

package() {
  cd "$srcdir"/alltray-$pkgver
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/etc/alltray
}

md5sums=('675a0a60f22fae04da787095ef0bd7d9' 'b7aa418a5f82d1d69eb752868d9c86af')
