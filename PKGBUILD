# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=graphlcd-base
pkgver=1.0.1.r0.g55d4bd8
_gitver=55d4bd88164f02e33d2c3d75a036437c50afe40e
pkgrel=1
epoch=1
pkgdesc="Project to support graphical LC displays connected to the PC"
url="http://projects.vdr-developer.org/projects/show/graphlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('fontconfig' 'graphicsmagick' 'libusb-compat' 'libvncserver')
optdepends=('serdisplib: Add support for more serial displays')
makedepends=('git')
backup=('etc/graphlcd.conf')
source=("git://projects.vdr-developer.org/graphlcd-base.git#commit=$_gitver")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make HAVE_DRIVER_AX206DPF=1 \
       HAVE_DRIVER_picoLCD_256x64=1 \
       HAVE_GRAPHICSMAGICK=1
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" \
       PREFIX=/usr \
       UDEVRULESDIR=/usr/lib/udev/rules.d \
       install
}
