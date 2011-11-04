# Maintainer: judd <jvinet@zeroflux.org>

_pkgbasename=alsa-oss
pkgname=lib32-${_pkgbasename}
pkgver=1.0.17
pkgrel=3
pkgdesc="OSS compatibility library (32 bit)"
arch=(x86_64)
license=('GPL')
url="http://www.alsa-project.org"
options=(!libtool)
depends=('lib32-glibc' 'lib32-alsa-lib' 'alsa-oss')
source=(ftp://ftp.alsa-project.org/pub/oss-lib/${_pkgbasename}-$pkgver.tar.bz2)
md5sums=('1b1850c2fc91476a73d50f537cbd402f')

build() {
  cd $srcdir/${_pkgbasename}-$pkgver

  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  ./configure --prefix=/usr  --libdir=/usr/lib32
  make
}

package() {
  cd $srcdir/${_pkgbasename}-$pkgver

  make DESTDIR="$pkgdir" install

  # Clean up lib32 package
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
