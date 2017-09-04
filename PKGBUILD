# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=tbt
pkgver=0.9
pkgrel=1
pkgdesc='Thunderbolt(TM) user-space components'
arch=('x86_64')
url='https://github.com/01org/thunderbolt-software-user-space'
license=('BSD')
makedepends=('cmake' 'boost')
source=("https://github.com/01org/thunderbolt-software-user-space/archive/v${pkgver}.tar.gz")
sha512sums=('6b3e0217cf41fc0a74bb38d94bdeab152b6763eb1aeea3f75ae853c290f2208ca0e5de549cd784ccfcc70a92ad11d3ca871c8f84dcc99c437278e6b0937832e3')

prepare() {
  cd "${srcdir}/thunderbolt-software-user-space-${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}/thunderbolt-software-user-space-${pkgver}/build"
  cmake ..
  make
}

package() {
  install -dm 750 "${pkgdir}/var/lib/thunderbolt/"

  cd "${srcdir}/thunderbolt-software-user-space-${pkgver}/"
  install -Dm 755 -t "${pkgdir}/usr/lib/udev/" build/tbtacl/tbtacl-write tbtacl/tbtacl
  install -Dm 644 tbtacl/tbtacl.rules "${pkgdir}/usr/lib/udev/rules.d/tbtacl.rules"
  install -Dm 644 build/common/libcommon.a "${pkgdir}/usr/lib/libcommon.a"
  install -Dm 755 build/tbtadm/tbtadm "${pkgdir}/usr/bin/tbtadm"
}
