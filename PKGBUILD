# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbasename=libao
pkgname=lib32-$_pkgbasename
pkgver=1.2.2
pkgrel=2
pkgdesc="A cross-platform audio output library and plugins (32-bit)"
url="https://www.xiph.org/ao/"
arch=('x86_64')
license=('GPL')
depends=($_pkgbasename 'lib32-glibc' 'lib32-alsa-lib' 'lib32-libpulse')
makedepends=('gcc-multilib' 'git')
#source=("https://downloads.xiph.org/releases/ao/${pkgname}-${pkgver}.tar.gz"
source=("git+https://git.xiph.org/libao.git#commit=3f4b02f046550aca54d7f11a5d9c56ac421f0b66")
sha256sums=('SKIP')

build() {
  #cd "$srcdir/$_pkgbasename-$pkgver"
  cd "$srcdir/$_pkgbasename"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  #cd "$srcdir/$_pkgbasename-$pkgver"
  cd "$srcdir/$_pkgbasename"

  make DESTDIR=$pkgdir/ install
  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
}
# vim:set ts=2 sw=2 et:
