# Maintainer : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>
# Contributor:  Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=shantz-xwinwrap-bzr
pkgver=20090421
pkgrel=3
pkgdesc="Utility to play Movies on your Desktop Or ElectricSheep"
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
arch=(i686 x86_64)
url="http://tech.shantanugoel.com/projects/linux/shantz-xwinwrap"
license=(Other/Open Source)
depends=(libxext libxrender)
provides=('xwinwrap')
conflicts=('xwinwrap')
makedepends=('bzr' 'make')

source=()
md5sums=()

_bzrroot="lp:xwinwrap"
_bzrmod="xwinwrap"

build() {
  cd ${srcdir}
  msg "Connecting to launchpad BZR server...."
  bzr branch $_bzrroot
  cd $_bzrmod
  if [ "$CARCH" == "i686" ]; then
    make all32 || return 1
  else
    make all64 || return 1
  fi
}
package() {
  cd $_bzrmod
  if [ "$CARCH" == "i686" ]; then
    install -D -m0755 ${srcdir}/xwinwrap/i386/xwinwrap ${pkgdir}/usr/bin/xwinwrap || return 1
  else
    install -D -m0755 ${srcdir}/xwinwrap/x86_64/xwinwrap ${pkgdir}/usr/bin/xwinwrap || return 1
  fi
}
