# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_basepkgname=libudev0-shim
pkgname=lib32-${_basepkgname}
pkgver=1
_commit='dbaa13dd5cbcebb6aea6c652402c67f156548935'
pkgrel=7
pkgdesc='libudev.so.0 compatibility library for systems with newer udev versions (32 bit)'
url='https://github.com/archlinux/libudev0-shim'
arch=('x86_64')
license=('LGPL-2.1-or-later')
provides=('lib32-libudev0')
conflicts=('lib32-libudev0')
depends=('lib32-systemd' 'libudev0-shim')
makedepends=('git')
source=("git+https://github.com/archlinux/libudev0-shim.git#commit=${_commit}")
sha512sums=('37fdb46a6b0bd9c34e393ad4daf99d3d9c9568e06b295324d3508dba59758b1bd088859931b76966d5451a3c81cf3864abb45125e3268709de21dbc3a047fff1')

build() {
  cd "${_basepkgname}"

  make CC="gcc -m32"
}

package() {
  cd "${_basepkgname}"

  install -Dm 0755 libudev.so.0.13.9999 -t "${pkgdir}/usr/lib32"
  ln -s libudev.so.0.13.9999 "${pkgdir}/usr/lib32/libudev.so.0"
}

# vim: ts=2 sw=2 et:
