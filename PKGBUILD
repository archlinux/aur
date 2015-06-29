# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libbluray
pkgname=lib32-${_pkgbase}
pkgver=0.8.1
pkgrel=2
pkgdesc="Library to access Blu-Ray disks for video playback (32 bit)"
arch=('x86_64')
url="http://www.videolan.org/developers/libbluray.html"
license=('LGPL2.1')
depends=("$_pkgbase" 'lib32-libxml2' 'lib32-freetype2' 'lib32-fontconfig')
makedepends=('gcc-multilib' 'apache-ant' 'java-environment')
source=(ftp://ftp.videolan.org/pub/videolan/$_pkgbase/$pkgver/$_pkgbase-$pkgver.tar.bz2)
sha512sums=('6618e01a567f0dc5d21302fc771d4155589c81703028b76f6090a2d12ef1c7e9d08d9c79312a7c8b2ca0d6c63ce980195f0866509a4f8f05f64ed6650c7f78dc')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cd $_pkgbase-$pkgver
  
  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --disable-doxygen-doc
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim:set ts=2 sw=2 et:
