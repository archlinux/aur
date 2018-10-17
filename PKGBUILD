# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=ibpd
pkgver=1.0.1
pkgrel=2
pkgdesc='OpenFabrics Alliance InfiniBand proxy daemon'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('glibc')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7351e64691783d2f3ddc8718d801c3d9e393f4e3c83b225aeea6f2d1be2d7346')

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
  install -Dm644 README "${pkgdir}/usr/share/docs/${pkgname}/README"
}
