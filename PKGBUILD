# Maintainer: Michael Armbruster <michael at armbrust dot me>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libbluray
pkgname=lib32-${_pkgbase}
pkgver=1.1.0
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback (32 bit)"
arch=('x86_64')
url="http://www.videolan.org/developers/libbluray.html"
license=('LGPL2.1')
depends=("$_pkgbase" 'lib32-fontconfig' 'lib32-glibc' 'lib32-freetype2' 'lib32-libxml2')
makedepends=('gcc-multilib' 'apache-ant' 'java-environment')
optdepends=('java-runtime: BD-J library')
provides=('libbluray.so')
source=("ftp://ftp.videolan.org/pub/videolan/$_pkgbase/$pkgver/$_pkgbase-$pkgver.tar.bz2")
sha512sums=('9e1c8408ded0548584cf9d01fdf8153bb713cae5bfc8ff4cb6ace92cddcb2f8546d08db960507e4be8a79741c6196176726da7befac4244f887ab72b35136e9d')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cd $_pkgbase-$pkgver
  
  ./configure --libdir=/usr/lib32 \
    --prefix=/usr \
    --with-java9 \
    --disable-doxygen-doc
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim:set ts=2 sw=2 et:
