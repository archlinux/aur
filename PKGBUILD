# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors
# * qperf can be built without librdmacm/libibverbs, but then has no RDMA support, and only works over TCP/IP.  See package qperf-nordma

pkgname=qperf
pkgver=0.4.9
pkgrel=3
pkgdesc='OpenFabrics Alliance InfiniBand performance benchmark for bandwidth and latency'
#        Works over TCP/IP and RDMA
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc' 'librdmacm')
conflicts=('qperf-nordma')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a9eea1953ee5379e57ae5fd7b09fecf2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
