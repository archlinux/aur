# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>
# Contributor:  Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=shantz-xwinwrap-bzr
pkgver=20090421
pkgrel=5
pkgdesc="Utility to play Movies on your Desktop Or ElectricSheep"
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
arch=(i686 x86_64)
url="https://shantanugoel.com/2008/09/03/shantz-xwinwrap/"
license=(MIT)
depends=(libxext libxrender)
provides=('xwinwrap')
conflicts=('xwinwrap')
makedepends=('bzr' 'python-dulwich')
source=('LICENSE')
sha512sums=('SKIP')

_bzrroot="lp:xwinwrap"
_bzrmod="xwinwrap"

build() {
  cd ${srcdir}
  msg "Connecting to launchpad BZR server...."
  bzr branch $_bzrroot
  cd $_bzrmod
  if [ "$CARCH" == "i686" ]; then
    make all32
  else
    make all64
  fi
}
package() {
	cd ${srcdir}
  if [ "$CARCH" == "i686" ]; then
    install -D -m0755 xwinwrap/i386/xwinwrap ${pkgdir}/usr/bin/xwinwrap
  else
    install -D -m0755 xwinwrap/x86_64/xwinwrap ${pkgdir}/usr/bin/xwinwrap
  fi
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
