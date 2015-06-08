# Maintainer: willemw <willemw12@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: rabyte <rabyteNOSPAM_at_moonblade.dot.org>

_pkgname=libtremor
pkgname=$_pkgname-svn
pkgver=r19483
pkgrel=1
pkgdesc="Integer-only, fully Ogg Vorbis compliant software decoder library"
arch=('i686' 'x86_64')
url="http://www.xiph.org/vorbis/"
license=('BSD')
depends=('libogg')
makedepends=('subversion')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!libtool')
source=($pkgname::svn+http://svn.xiph.org/trunk/Tremor)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $pkgname
  # Fix for automake 1.13
  sed -i "s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/" configure.in
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

