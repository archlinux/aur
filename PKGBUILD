# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=abiocard
pkgver=2015_02_28
pkgrel=2
pkgdesc='programs for abiocard'
arch=('armv6h' 'armv7h')
url='https://www.axiris.eu/en/index.php/i-o-cards/abiocard/documents-and-software'
license=('GPL')
source=("https://www.axiris.eu/download/abiocard/sw_$pkgver/abiocard.tar.gz"
        'hardware.patch')
sha256sums=('a6bf6fdadbcd926c2bc88c41439094547de9a7e6675c51ad7935ca4d63c3b2ee'
            'c90a334f2dd503d4d1862f297336863c9b9ac0b340043755a9fc4b2f58628d86')

prepare() {
  cd "${srcdir}/${pkgname}/"

  patch -p0 -i "${srcdir}/hardware.patch"
}

build() {
  cd "${srcdir}/${pkgname}/"

  cp common/arm-linux-gnueabihf/platform.h common/platform.h
  cd abiocard

  make -f abiocardserver.mk clean
  make -f abiocardtime.mk clean

  make -f abiocardserver.mk
  make -f abiocardtime.mk
}

package(){
  cd "${srcdir}/${pkgname}/abiocard"

  install -Dm755 abiocardserver ${pkgdir}/usr/bin/abiocardserver
  install -Dm755 abiocardtime ${pkgdir}/usr/bin/abiocardtime
}
