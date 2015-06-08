# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgbase=libgctp
pkgname=('libgctp' 'libgctp-doc')
pkgver=2.0
pkgrel=1
arch=(i686 x86_64)
url="http://gcmd.nasa.gov/records/USGS-GCTP.html"
license=('unknown')
source=("http://ftp.us.debian.org/debian/pool/main/libg/libgctp/libgctp_$pkgver.orig.tar.gz"
        "fix.patch")
sha256sums=('219953b1594a814c3b30a0e9f7dde8634f0143d0597a5ffba6cf267d2a03a474'
            'f6ce645248cf09392f8b9c54e68a93696877bcce43ead6dbeeacd3be9b35df90')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  patch -p1 -i ../fix.patch
}

build() {
  cd "$srcdir/$pkgbase-$pkgver/source"
  make shared
}

package_libgctp() {
  pkgdesc="General Cartographic Transformation Package"

  cd "$pkgbase-$pkgver/source"
  make DESTDIR="$pkgdir" install
}

package_libgctp-doc() {
  pkgdesc="General Cartographic Transformation Package - documentation"
  arch=(any)

  cd "$pkgbase-$pkgver/doc"
  _dest="$pkgdir/usr/share/doc/libgctp/"
  mkdir -p ${_dest}
  cp ./* ${_dest}
}
