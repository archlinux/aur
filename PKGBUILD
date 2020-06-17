# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: <Eugeny Borisov flekst@gmail.com>
# Based on [extra]'s xf86-input-evdev: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/xf86-input-evdev

_pkgname=xorg-xf86-input-evdev
pkgname=xf86-input-evdev-git
pkgver=2.10.6.r2.g7103611
pkgrel=2
pkgdesc="X.org evdev input driver (Git)"
arch=('i686' 'x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('systemd-libs' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.1' 'xorgproto' 'git')
provides=("$_pkgname=$pkgver" 'xorg-server' 'X-ABI-XINPUT_VERSION' 'X-ABI-XINPUT_VERSION')
conflicts=('xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<24.1' 'X-ABI-XINPUT_VERSION>=25' "$_pkgname")
options=('!makeflags')
source=("git+https://github.com/freedesktop/xorg-xf86-input-evdev.git")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  # cutting off 'xf86.input.evdev.' prefix that presents in the git tag
  git describe --long | sed 's/^xf86.input.evdev.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"

}
