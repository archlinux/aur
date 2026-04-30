# Maintainer: AngryNui
pkgname=hid-logishifter-dkms
pkgver=0.1.0
pkgrel=1
pkgdesc="DKMS kernel driver for the InterBiometrics Logitech@ Shifter USB adapter (1209:f00d)"
arch=('x86_64')
url="https://github.com/AngryNui/hid-logishifter"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/AngryNui/hid-logishifter.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/hid-logishifter"

  install -Dm644 hid-logishifter.c \
    "${pkgdir}/usr/src/hid-logishifter-${pkgver}/hid-logishifter.c"

  install -Dm644 Makefile \
    "${pkgdir}/usr/src/hid-logishifter-${pkgver}/Makefile"

  sed "s/@PKGVER@/${pkgver}/g" dkms.conf > dkms.conf.fixed
  install -Dm644 dkms.conf.fixed \
    "${pkgdir}/usr/src/hid-logishifter-${pkgver}/dkms.conf"
  rm -f dkms.conf.fixed

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 99-hid-logishifter.rules \
    "${pkgdir}/etc/udev/rules.d/99-hid-logishifter.rules"
}
