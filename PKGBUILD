# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_basepkgname=libudev0-shim
pkgname=lib32-${_basepkgname}
pkgver=1
pkgrel=5
pkgdesc='libudev.so.0 compatibility library for systems with newer udev versions (32 bit)'
url='https://github.com/archlinux/libudev0-shim'
arch=('x86_64')
license=('GPL')
provides=('lib32-libudev0')
conflicts=('lib32-libudev0')
depends=('lib32-systemd' 'libudev0-shim')
makedepends=('systemd')
source=(${_basepkgname}.tar.gz::https://github.com/archlinux/libudev0-shim/archive/v${pkgver}.tar.gz)
sha512sums=('794810b20be6391cb6af53c2c49705f8bd884dd6eb5d1fd5b659481a01490205cc60e0f1904c020fb0e59e984583762ba6775f977a78b95a40ba82eb93965387')

build() {
  cd ${_basepkgname}-${pkgver}
  unset LDFLAGS
  make CC="gcc -m32"
}

package() {
  cd ${_basepkgname}-${pkgver}
  install -Dm 755 libudev.so.0.0.9999 -t "${pkgdir}/usr/lib32"
  ln -s libudev.so.0.0.9999 "${pkgdir}/usr/lib32/libudev.so.0"
}

# vim: ts=2 sw=2 et:
