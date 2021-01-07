# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=graphlcd-base
pkgver=2.0.2
pkgrel=1
epoch=1
pkgdesc="Project to support graphical LC displays connected to the PC"
url="http://projects.vdr-developer.org/projects/show/graphlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('fontconfig' 'graphicsmagick' 'libusb-compat' 'libvncserver')
optdepends=('serdisplib: Add support for more serial displays')
backup=('etc/graphlcd.conf')
source=("https://projects.vdr-developer.org/git/graphlcd-base.git/snapshot/graphlcd-base-$pkgver.tar.bz2")
sha256sums=('3a869312534fc84228a92001b99f61e7e716f3a6475c1572fa0c53c3df251c74')

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
