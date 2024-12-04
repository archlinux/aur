# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=rtpengine-kernel-dkms
pkgver=13.0.1.5
pkgrel=1
pkgdesc='Kernel module for rtpengine media proxy'
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('dkms')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('087c3c4279d3a6390138ff6a727ec65b216735522e71e2da1dcdd9f47fb55f1c')

prepare() {
  cd rtpengine-mr${pkgver}

  # Set version
  sed -e "s|#MODULE_VERSION#|$pkgver|" -e "s|ngcp-||" debian/ngcp-rtpengine-kernel-dkms.dkms >dkms.conf
  # Insert patches below this line
}

package() {
  cd rtpengine-mr${pkgver}

  install -Dm644 -t ${pkgdir}/usr/src/rtpengine-${pkgver} dkms.conf kernel-module/{Makefile,*{.inc,.c,.h}}
  # Automatic module loading during boot
  install -Dm644 kernel-module/xt_RTPENGINE.modules.load.d ${pkgdir}/etc/modules-load.d/${pkgname}.conf
}

# vim:set ts=2 sw=2 et:
