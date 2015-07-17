# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libnes
pkgver=1.1.4
pkgrel=1
pkgdesc='OpenFabrics Alliance NetEffect Ethernet Cluster Server libibverbs plug-in'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/downloads/nes/README.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs')
source=("https://www.openfabrics.org/downloads/nes/${pkgname}-${pkgver}.tar.gz")
md5sums=('7702b473a6d3d11a5262e8e9306de557')

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
