# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib
pkgver=2.13.0
_pkgver=2_13_0
pkgrel=3
pkgdesc="Open Source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cinecert/asdcplib/archive/rel_${_pkgver}.tar.gz")
sha256sums=('c633cd9712dbf4e606c11a0f17f6bdb9084ae82e71bc101da7a69adf3142fd15')

prepare() {
  cd ${pkgname}-rel_${_pkgver}
  autoreconf -if
  ./configure --enable-freedist --enable-as-02 --prefix=/usr
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
}

build() {
  cd ${pkgname}-rel_${_pkgver}
  make
  make dist
}

package() {
  cd ${pkgname}-rel_${_pkgver}
  make DESTDIR=${pkgdir} install
}
