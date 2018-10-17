# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=qperf
pkgver=0.4.11
pkgrel=3
pkgdesc='OpenFabrics Alliance InfiniBand performance benchmark for bandwidth and latency (supports TCP/IP and RDMA)'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2')
depends=('rdma-core')
conflicts=('qperf-nordma')
source=("https://github.com/linux-rdma/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b0ef2ffe050607566d06102b4ef6268aad08fdc52898620d429096e7b0767e75')

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
}
