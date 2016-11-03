# Maintainer: Justin Dray <justin@dray.be>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>
pkgname=lib32-vo-aacenc
_pkgname=vo-aacenc
pkgver=0.1.3
pkgrel=1
pkgdesc="VisualOn Advanced Audio Coding (AAC) encoder"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('APACHE')
depends=('glibc')
options=('!emptydirs' '!libtool')
source=(http://heanet.dl.sourceforge.net/project/opencore-amr/vo-aacenc/$_pkgname-$pkgver.tar.gz)
sha256sums=('e51a7477a359f18df7c4f82d195dab4e14e7414cbd48cf79cc195fc446850f36')

build() {
  export CC="clang -m32"
  export CXX="clang++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package () {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/include
}

