# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libibmad
pkgver=1.3.13
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand MAD (MAnagement Datagram) library'
#        Low leayer InfiniBand functions, including:
#           * Management Datagrams (MAD)
#           * Subnet Administration (SA)
#           * Subnet Management Packets (SMP)
#        Used by InfiniBand diagnostic and management programs.
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibumad')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz")
md5sums=('29c7723ec08dac02403bb307e03c86cd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
