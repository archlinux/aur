# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=perftest
pkgver=4.4.0.5
_pkgver=4.4-0.5
pkgrel=2
pkgdesc='OpenFabrics Alliance Infiniband verbs performance testing and benchmarking tools'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('rdma-core' 'bash')
source=("https://github.com/linux-rdma/${pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('d09dfce9823b67ec62bec54433a6bcf20fb5653c3537d8679e9ef93f8b3c384e')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
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
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm755 runme "${pkgdir}/usr/bin/perftest-runme"
}
