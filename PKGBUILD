# Maintainer: Michael Armbruster <michael at armbrust dot me>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libbluray
pkgname=lib32-${_pkgbase}
pkgver=1.0.2
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback (32 bit)"
arch=('x86_64')
url="http://www.videolan.org/developers/libbluray.html"
license=('LGPL2.1')
depends=("$_pkgbase" 'lib32-fontconfig' 'lib32-glibc' 'lib32-freetype2' 'lib32-libxml2')
makedepends=('gcc-multilib' 'apache-ant' 'java-environment=8')
optdepends=('java-runtime=8: BD-J library')
provides=('libbluray.so')
source=("ftp://ftp.videolan.org/pub/videolan/$_pkgbase/$pkgver/$_pkgbase-$pkgver.tar.bz2")
sha512sums=('e1360ad08aa6cc67a80efa81a09004faebbe31105f1961494f82f655e3e7378b198ee3bc534b0d0c2bfec726939b11b545cc8bbfa30794fc647432dadf71089b')

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
