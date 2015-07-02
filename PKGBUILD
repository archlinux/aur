# Contributor: ganymede

pkgname=skdet
pkgver=1.0
pkgrel=1
pkgdesc='Simple rootkit detector that can be used by rkhunter.'
arch=('i686' 'x86_64')
url='http://dvgevers.home.xs4all.nl/'
license=('GPL')
depends=()
source=("http://dvgevers.home.xs4all.nl/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "http://dvgevers.home.xs4all.nl/${pkgname}/${pkgname}-fix-includes.diff")
sha256sums=('a5842d3e56c8586c52879700453f740744c374a1f2c648eef337cae7e244e7b6'
            '1ee83c1122dfe74c8aec7800fe0026affda6ea37c7643491fd8df62f08ed2fbc')

build() {
  cd "${pkgname}-${pkgver}"
  rm "${pkgname}"
  patch -N -p1 -i "${srcdir}/skdet-fix-includes.diff"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -dm 755 "${pkgdir}/usr/bin"
  install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/tests"
  install -m 750 "${pkgname}" "${pkgdir}/usr/bin/"
  install -m 644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/"
  install -m 644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/"
  install -m 644 CONTRIBUTIONS "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/"
  install -m 644 CREDITS "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/"
  install -m 644 README "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/"
  install -m 644 tests/* "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/tests/"
}
