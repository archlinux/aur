# Maintainer: Justin Dray <justin@dray.be>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>
pkgname=lib32-vo-aacenc
_pkgname=vo-aacenc
pkgver=0.1.3
pkgrel=2
pkgdesc="VisualOn Advanced Audio Coding (AAC) encoder"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('APACHE')
depends=('glibc')
options=('!emptydirs' '!libtool')
source=(https://github.com/mstorsjo/vo-aacenc/archive/v${pkgver}.tar.gz)
sha256sums=('ae38610405f862237f6c70360c406297cc4222abf82e86722c505ba74b53a97d')

build() {
  export CC="clang -m32"
  export CXX="clang++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf -vfi
  ./configure --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package () {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/include
}

