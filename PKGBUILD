# Maintainer: basxto <archlinux basxto de>
# based on gbdk package

pkgname=gbdk-2020
pkgver=3.2
pkgrel=4
pkgdesc="An updated version of Game Boy Development Kit"
url="https://github.com/Zal0/gbdk-2020"
license=('MIT')
arch=('x86_64' 'i686')
makedepends=('sdcc' 'svn')
depends=('sdcc')
conflicts=('gbdk' 'lcc')
# this is branch lcc-patch
source=("git+https://github.com/basxto/gbdk-2020#commit=87969af9aae690f85439460e73131273af3c8f4a")
#should be merged in the next version
#source=("https://github.com/Zal0/gbdk-2020/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  make -C ${pkgname} gbdk-build gbdk-support-install gbdk-lib-install TARGETDIR=/opt/${pkgname} BINDIR=/usr/bin/ SDCCDIR=/usr/
  mkdir -p ${pkgdir}/usr
  mkdir -p ${pkgdir}/opt

  mv ${pkgname}/build/gbdk ${pkgdir}/opt/${pkgname}
  mv ${pkgdir}/opt/${pkgname}/bin ${pkgdir}/usr/
  find ${pkgdir}/opt/${pkgname}/ -type f -name '*.bat' -delete
}
