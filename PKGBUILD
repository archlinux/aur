# Maintainer: basxto <archlinux basxto de>
# based on gbdk package

pkgname=gbdk-2020
pkgver=4.0.3
pkgrel=1
pkgdesc="An updated version of Game Boy Development Kit"
url="https://github.com/Zal0/gbdk-2020"
license=('MIT')
arch=('x86_64' 'i686')
makedepends=('git' 'sdcc>=4.1.0')
depends=('sdcc>=4.1.0')
conflicts=('gbdk' 'lcc')
source=("https://github.com/Zal0/gbdk-2020/archive/${pkgver}.tar.gz")
sha256sums=('53d90bfa5ec63e1c39ceedb653acaed92309e8b5d34a2d1239717947f469e75f')
options=('!strip')

package() {
  make -C ${pkgname}-${pkgver} gbdk-build gbdk-support-install gbdk-lib-install TARGETDIR=/usr/share/${pkgname}/ BINDIR=/usr/bin/ SDCCDIR=/usr/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/

  mv ${pkgname}-${pkgver}/build/gbdk ${pkgdir}/usr/share/${pkgname}
  mv ${pkgdir}/usr/share/${pkgname}/bin ${pkgdir}/usr/
  find ${pkgdir}/usr/share/${pkgname}/ -type f -name '*.bat' -delete -o -type f -name '*.dox' -delete
  rm -rf ${pkgdir}/usr/share/${pkgname}/examples/
  cp ${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
