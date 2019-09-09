# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=perftest
pkgver=4.4.0.8
_pkgver=4.4-0.8
pkgrel=1
pkgdesc='OpenFabrics Alliance Infiniband verbs performance testing and benchmarking tools'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('rdma-core' 'bash')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/linux-rdma/${pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('3048720d6d4f7de4fbe12e194907670e94deb1b4f0b022c3227ea2ec569050b5')

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
