# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=perftest
pkgver=4.4.0.6
_pkgver=4.4-0.6
pkgrel=1
pkgdesc='OpenFabrics Alliance Infiniband verbs performance testing and benchmarking tools'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('rdma-core' 'bash')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/linux-rdma/${pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('41660ad7de0a9447111b88dc854e867cec81771b3e3408bb34dee781ea718963')

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
