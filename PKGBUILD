# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=graphlcd-base
pkgver=2.0.3
pkgrel=1
epoch=1
pkgdesc="Project to support graphical LC displays connected to the PC"
url='https://github.com/M-Reimer/graphlcd-base'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('fontconfig' 'graphicsmagick' 'libusb-compat' 'libvncserver')
optdepends=('serdisplib: Add support for more serial displays')
backup=('etc/graphlcd.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2f50567225acd05d287e6161ff9540806b1dd9a57e7145e1e3fc5239159f677f')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make HAVE_DRIVER_AX206DPF=1 \
       HAVE_DRIVER_picoLCD_256x64=1 \
       HAVE_GRAPHICSMAGICK=1
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make DESTDIR="${pkgdir}" \
       PREFIX=/usr \
       UDEVRULESDIR=/usr/lib/udev/rules.d \
       install
}
