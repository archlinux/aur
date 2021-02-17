# Maintainer: basxto <archlinux basxto de>
# based on gbdk package

pkgname=gbdk-2020
pkgver=4.0.2
pkgrel=2
pkgdesc="An updated version of Game Boy Development Kit"
url="https://github.com/Zal0/gbdk-2020"
license=('MIT')
arch=('x86_64' 'i686')
makedepends=('git' 'sdcc>=4.0.7.svn12016M')
depends=('sdcc>=4.0.7.svn12016M')
conflicts=('gbdk' 'lcc')
# those are merged patches for 4.0.2 (not exactly release 4.0.2)
source=("git+https://github.com/Zal0/gbdk-2020#commit=c2edd502370ea39893f02e9fa58a772f0488071f")
# should be merged in the next version
#source=("https://github.com/Zal0/gbdk-2020/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')
options=('!strip')

package() {
  make -C ${pkgname} gbdk-build gbdk-support-install gbdk-lib-install TARGETDIR=/usr/share/${pkgname}/ BINDIR=/usr/bin/ SDCCDIR=/usr/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/

  mv ${pkgname}/build/gbdk ${pkgdir}/usr/share/${pkgname}
  mv ${pkgdir}/usr/share/${pkgname}/bin ${pkgdir}/usr/
  find ${pkgdir}/usr/share/${pkgname}/ -type f -name '*.bat' -delete
  rm -rf ${pkgdir}/usr/share/${pkgname}/examples/
  cp ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
