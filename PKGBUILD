# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=ibpd
pkgver=1.0.1
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand proxy daemon'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2')
depends=('glibc')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('688c17adf3b4f591ca3999043f9f29a2')

#prepare() {
  ## v1.0.1 Makefile is hard coded to use sbin
  #sed -i "s|(prefix)/sbin/ibpd|(prefix)/bin/ipbd|" "${srcdir}/${pkgname}-${pkgver}/Makefile"
#}

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
