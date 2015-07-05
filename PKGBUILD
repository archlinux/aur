
pkgname=libdvbpsi8
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="Provides libdvbpsi.so.8 (Older version of libdvbpsi)"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('glibc')
#replaces=('libdvbpsi4' 'libdvbpsi5')
#conflicts=('libdvbpsi4' 'libdvbpsi5')
url="http://developers.videolan.org/libdvbpsi/"
source=("http://download.videolan.org/libdvbpsi/${pkgver}/libdvbpsi-${pkgver}.tar.bz2")
md5sums=('SKIP')

build() {
  export CFLAGS="$CFLAGS -Wno-error=bool-compare"
  cd "${srcdir}/libdvbpsi-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/libdvbpsi-${pkgver}"
 install -Dm755 "./src/.libs/libdvbpsi.so.8.0.0" "${pkgdir}/usr/lib/libdvbpsi.so.8.0.0"
 cd "$pkgdir/usr/lib"
 ln -s libdvbpsi.so.8.0.0 libdvbpsi.so.8

#  make prefix="${pkgdir}/usr" install
}
