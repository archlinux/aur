# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org>

_name=at-home-modifier
pkgname=xf86-input-evdev-ahm
_pkgname_orig=xf86-input-evdev
pkgver=2.10.0
pkgrel=1
pkgdesc='X.org evdev input driver + at-home-modifier patch'
arch=(i686 x86_64)
url='https://gitlab.com/at-home-modifier/at-home-modifier-evdev/wikis/home'
_url_orig='http://xorg.freedesktop.org/'
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.16.0' 'X-ABI-XINPUT_VERSION<21' 'X-ABI-XINPUT_VERSION>=22' 'xf86-input-evdev')
provides=('xf86-input-evdev=2.10.0')
options=('!makeflags')
groups=('xorg-drivers' 'xorg')
source=(${_url_orig}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2{,.sig} ahm-2.10.0.patch)
sha256sums=('d097298eb07b7a9edf4493b5c3c058041458ca52c8c62dbd4f40b84c5086d117'
            'SKIP'
            '66481cea220eb0764b5150f63d6915a06598d62f84675d515b6eeacb63f6fe7e')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  cd "${_pkgname_orig}-${pkgver}"
  patch -p1 -i "${srcdir}/ahm-2.10.0.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname_orig}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
