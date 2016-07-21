# $Id$
# Maintainer: R. Agnese <ragnese at tutanota.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot
# Contributor: Reddit user "oniram" (https://www.reddit.com/r/linux/comments/4tr0ji/libinput_is_done/d5jx8g2)

_basename=libinput
pkgname=libinput-swap-two-and-three-finger-tap
pkgver=1.4.0
pkgrel=1
pkgdesc="Input device management and event handling library with patch to swap two and three finger tap on touchpads"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/libinput/"
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
conflicts=('libinput')
provides=("${_basename}=$pkgver")
# currently no doc files to install
#makedepends=('doxygen' 'graphviz' 'gtk3')
#checkdepends=('check' 'libunwind')
source=(http://freedesktop.org/software/${_basename}/${_basename}-$pkgver.tar.xz{,.sig}
        swap-two-and-three-finger-tap.patch)
sha256sums=('76ef10874519d1a67b57e5c68ede06106b9fbf611a3ecf69c84886107c67b420'
            'SKIP'
            'be55ea78922c5f36a57cf267f02fe291d9fe18524e533101bda7204c7630e455')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd ${_basename}-$pkgver
  patch -p1 <../swap-two-and-three-finger-tap.patch
}

build() {
  cd ${_basename}-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd ${_basename}-$pkgver
# disabled for now:
# https://github.com/libcheck/check/issues/18
#  make check
}

package() {
  cd ${_basename}-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_basename}/COPYING"
}

