# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=lib32-libgtkhtml
pkgver=2.11.1
pkgrel=1
pkgdesc="An HTML library for GTK"
arch=('x86_64')
url="http://www.gnome.org"
license=('GPL')
groups=('lib32')
depends=('lib32-gtk2>=2.22.1' 'lib32-libxml2>=2.7.8')
makedepends=('gcc-multilib' 'gcc-libs-multilib')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/libgtkhtml/2.11/libgtkhtml-$pkgver.tar.gz")
sha256sums=('905efcb61ca0cf3b876af55d4ee2a7685472594c2bd5d318b00fb289d5de6c3b')

build() {
  export CC='gcc'
  export CFLAGS='-m32'
  export CXX='g++'
  export CXXFLAGS='-m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "libgtkhtml-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd "libgtkhtml-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/include"
}
