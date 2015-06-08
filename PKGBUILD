# $Id$

_name=at-home-modifier
pkgname=xf86-input-evdev-ahm
_pkgname_orig=xf86-input-evdev
pkgver=2.9.1
pkgrel=1
pkgdesc="X.org evdev input driver + at-home-modifier patch"
arch=(i686 x86_64)
url="https://gitorious.org/at-home-modifier"
_url_orig="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.16.0' 'X-ABI-XINPUT_VERSION<21' 'X-ABI-XINPUT_VERSION>=22' 'xf86-input-evdev')
provides=('xf86-input-evdev=2.9.1')
options=('!makeflags')
groups=('xorg-drivers' 'xorg')
install=ahm.install
source=(${_url_orig}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2{,.sig} ahm-2.9.1.patch)
sha256sums=('0ce30328adfeac90a6f4b508d992fb834d8e50b484b29d3d58cf6683fa8502f9'
            'SKIP'
            '9415bfff270a1117693e29eb61b02475fd43d8913e606cb57b456b97c292aa57')

build() {
  cd ${_pkgname_orig}-${pkgver}
  patch -p1 -i $srcdir/ahm-2.9.1.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname_orig}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
