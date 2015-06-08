# $Id$

_name=at-home-modifier
pkgname=xf86-input-evdev-ahm
_pkgname_orig=xf86-input-evdev
pkgver=2.9.2
pkgrel=1
pkgdesc="X.org evdev input driver + at-home-modifier patch"
arch=(i686 x86_64)
url="https://gitorious.org/at-home-modifier"
_url_orig="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.16.0' 'X-ABI-XINPUT_VERSION<21' 'X-ABI-XINPUT_VERSION>=22' 'xf86-input-evdev')
provides=('xf86-input-evdev=2.9.2')
options=('!makeflags')
groups=('xorg-drivers' 'xorg')
install=ahm.install
source=(${_url_orig}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2{,.sig} ahm-2.9.2.patch)
sha256sums=('792329b531afc6928ccda94e4b51a5520d4ddf8ef9a00890a5d0d31898acefec'
            'SKIP'
            'ad66def281b6f7b3a97e85e162b9f52bc906ff807de9893009801d8adeeb34be')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  cd ${_pkgname_orig}-${pkgver}
  patch -p1 -i $srcdir/ahm-2.9.2.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname_orig}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
