# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org>

_name=at-home-modifier
pkgname=xf86-input-evdev-ahm
_pkgname_orig=xf86-input-evdev
pkgver=2.9.0
pkgrel=1
pkgdesc="X.org evdev input driver + at home modifier patch"
arch=(i686 x86_64)
url="https://gitorious.org/at-home-modifier"
_url_orig="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.15.0' 'X-ABI-XINPUT_VERSION<20' 'X-ABI-XINPUT_VERSION>=21' 'xf86-input-evdev')
provides=('xf86-input-evdev=2.9.0')
options=('!makeflags')
groups=('xorg-drivers' 'xorg')
install=ahm.install
source=(${_url_orig}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2 ahm-2.9.0.patch)
sha256sums=('0c0c4aa393cb027a2304967944867a21a340bcad2e5efe630291b6906c3abc35'
            '450fb96642910a84fa578e7a001c746b6f3d656ec24532f3f3744bfd7234b18e')

build() {
  cd ${_pkgname_orig}-${pkgver}
  patch -p1 -i $srcdir/ahm-2.9.0.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname_orig}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
