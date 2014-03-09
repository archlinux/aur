# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: dorphell <dorphell@archlinux.org>
_pkgbasename=libao
pkgname=lib32-$_pkgbasename
pkgver=1.0.0
pkgrel=1
pkgdesc="A cross-platform audio output library and plugins (32-bit)"
url="http://www.xiph.org/ao/"
arch=('x86_64')
license=('GPL')
depends=($_pkgbasename 'lib32-glibc' 'lib32-alsa-lib' 'lib32-libpulse')
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://downloads.xiph.org/releases/ao/$_pkgbasename-$pkgver.tar.gz")
md5sums=('08283fbe1f587619053a156254afecec')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  make DESTDIR=$pkgdir/ install
  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
}
# vim:set ts=2 sw=2 et:
