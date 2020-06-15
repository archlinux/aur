# Maintainer: basxto <archlinux basxto de>
# based on gbdk package

pkgname=gbdk-2020
pkgver=3.2
pkgrel=2
pkgdesc="An updated version of Game Boy Development Kit"
url="https://github.com/Zal0/gbdk-2020"
license=('MIT')
arch=('x86_64' 'i686')
makedepends=('sdcc')
depends=('sdcc')
conflicts=('gbdk' 'lcc')
source=("git+https://github.com/basxto/gbdk-2020#commit=01cdbb621afa61de77e394de76161bd8aa65848d")
#should be merged in the next version
#source=("https://github.com/Zal0/gbdk-2020/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  sed "s|%prefix%bin/|/usr/bin/|g" -i ${pkgname}/gbdk-support/lcc/gb.c
  make -C ${pkgname} gbdk-build TARGETDIR=/opt/${pkgname} SDCCDIR=/usr/
  make -C ${pkgname} gbdk-install-nosdcc TARGETDIR=/opt/${pkgname} SDCCDIR=/usr/
  mkdir -p ${pkgdir}/usr
  mkdir -p ${pkgdir}/opt

  mv ${pkgname}/build/gbdk ${pkgdir}/opt/${pkgname}
  mv ${pkgdir}/opt/${pkgname}/bin ${pkgdir}/usr/
  find ${pkgdir}/opt/${pkgname}/ -type f -name '*.bat' -delete
}
