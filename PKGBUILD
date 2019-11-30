# Maintainer: Tod Jackson <tod.jackson@gmail.com>
# Contributor: Michael Armbruster <michael at armbrust dot me>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libbluray
pkgname=lib32-${_pkgbase}
pkgver=1.1.2
pkgrel=3
pkgdesc="Library to access Blu-Ray disks for video playback (32 bit)"
arch=('x86_64')
url="http://www.videolan.org/developers/libbluray.html"
license=('LGPL2.1')
depends=("$_pkgbase" 'lib32-fontconfig' 'lib32-glibc' 'lib32-freetype2' 'lib32-libxml2')
makedepends=('gcc-multilib')
provides=('libbluray.so')
source=("ftp://ftp.videolan.org/pub/videolan/$_pkgbase/$pkgver/$_pkgbase-$pkgver.tar.bz2")
sha512sums=('5a82af6c1840a1dcb31d06d90203c68e2c4f0bbadc9212eb0bb2776d42b0ab3793a769ebe07b3051be151e8b15876874d5a0658292f72b7126dd915a1ada3fe7')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cd $_pkgbase-$pkgver
  
  ./configure --libdir=/usr/lib32 \
    --prefix=/usr \
    --disable-doxygen-doc \
    --disable-bdjava-jar \
    --disable-jni-jar \
    --host=i686-unknown-linux-gnu
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim:set ts=2 sw=2 et:
