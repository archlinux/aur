# Maintainer: grimi <grimi at poczta dot fm>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=gtk-engines
pkgname=lib32-$_pkgbase
pkgver=2.21.0
pkgrel=3
pkgdesc="Theme engines for GTK+ 2 (32 bit)"
arch=('x86_64')
url="http://live.gnome.org/GnomeArt"
license=('LGPL')
depends=('lib32-gtk2' "$_pkgbase")
makedepends=('intltool' 'gcc-multilib')
options=('!libtool')
source=(https://sources.archlinux.org/other/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('d82ae66d6eb045d83c30b78b13818d41')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr --enable-animation --libdir=/usr/lib32
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/share
}
