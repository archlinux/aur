# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=ibpd
pkgver=1.0.0
_pkgver_subver=2
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand proxy daemon'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2')
depends=('glibc')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}.tar.gz")
md5sums=('875113f31fb93e9488dede2b21c7c508')

prepare() {
  # v1.0.0-2 Makefile is hard coded to use sbin
  sed -i "s|(prefix)/sbin/ibpd|(prefix)/bin/ipbd|" "${srcdir}/${pkgname}-${pkgver}-${_pkgver_subver}/Makefile"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-${_pkgver_subver}"
  # ibpd doesn't use configure, just make
  # and its Makefile doesn't have just "make" do anything
  make ibpd
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-${_pkgver_subver}"
  make DESTDIR="${pkgdir}" install
}
