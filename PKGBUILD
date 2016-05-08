# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libbluray
pkgname=lib32-${_pkgbase}
pkgver=0.9.2
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback (32 bit)"
arch=('x86_64')
url="http://www.videolan.org/developers/libbluray.html"
license=('LGPL2.1')
#depends=("$_pkgbase" 'lib32-fontconfig' 'lib32-glibc' 'libfreetype.so' 'lib32-libxml2' 'lib32-freetype2')
depends=("$_pkgbase" 'lib32-fontconfig' 'lib32-glibc' 'lib32-freetype2' 'lib32-libxml2' 'lib32-freetype2')
makedepends=('gcc-multilib' 'apache-ant' 'java-environment')
optdepends=('java-environment: BD-J library')
provides=('libbluray.so')
source=("ftp://ftp.videolan.org/pub/videolan/$_pkgbase/$pkgver/$_pkgbase-$pkgver.tar.bz2")
sha512sums=('f7fda2ef4c0ec70eb9a38aed0e76d21d8784410cb13713e7ee66ecd23a1cc58325977b046d40c526554a4a4e4cf96706a233e15451bf34892aff201b47e25aef')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cd $_pkgbase-$pkgver
  
  ./configure --libdir=/usr/lib32 \
    --prefix=/usr \
    --disable-doxygen-doc
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim:set ts=2 sw=2 et:
