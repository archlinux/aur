pkgname=hid-chandbreak-dkms
pkgver=0.1.0
pkgrel=1
pkgdesc="DKMS kernel driver for USB sim handbrake devices based on LeafLabs Maple (1eaf:0024)"
arch=('x86_64')
url="https://github.com/AngryNui/hid-chandbreak"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/AngryNui/hid-chandbreak.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/hid-chandbreak"

  install -Dm644 hid-chandbreak.c \
    "${pkgdir}/usr/src/hid-chandbreak-${pkgver}/hid-chandbreak.c"

  install -Dm644 Makefile \
    "${pkgdir}/usr/src/hid-chandbreak-${pkgver}/Makefile"

  sed "s/@PKGVER@/${pkgver}/g" dkms.conf > dkms.conf.fixed
  install -Dm644 dkms.conf.fixed \
    "${pkgdir}/usr/src/hid-chandbreak-${pkgver}/dkms.conf"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}