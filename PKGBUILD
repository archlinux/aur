# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libiwpm
pkgver=1.0.5
pkgrel=1
pkgdesc='OpenFabrics Alliance userspace service for iWarp drivers to claim TCP ports'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/downloads/libiwpm/README.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libnl')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0771a6de238edccb84a02559664f4fa58ea0e2c87ad1c3174538d84b48691227')

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
