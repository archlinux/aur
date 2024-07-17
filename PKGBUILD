# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_basepkgname=libudev0-shim
pkgname=lib32-${_basepkgname}
pkgver=2
pkgrel=1
pkgdesc='libudev.so.0 compatibility library for systems with newer udev versions (32 bit)'
url='https://github.com/archlinux/libudev0-shim'
arch=('x86_64')
license=('LGPL-2.1-or-later')
provides=('lib32-libudev0')
conflicts=('lib32-libudev0')
depends=('lib32-systemd' 'libudev0-shim')
makedepends=('git')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D') # Emil Velikov <emil.l.velikov@gmail.com>
source=("git+https://github.com/archlinux/libudev0-shim.git#tag=v${pkgver}?signed")
sha512sums=('eb77f1af1079a9c2dc0cd34a8a29ccffba012a4cf2f947b0ab2d669e98ee94c3e3c43aba73cfa29feb54422e4f0caa7022a5d15a7012fb57651e5a72a2d39f10')

build() {
  cd "${_basepkgname}"

  make CC="gcc -m32"
}

package() {
  cd "${_basepkgname}"

  make DESTDIR="${pkgdir}" libdir='/usr/lib32' install
}

# vim: ts=2 sw=2 et:
