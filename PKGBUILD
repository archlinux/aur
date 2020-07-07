# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libudev0-shim
pkgver=1
pkgrel=4
pkgdesc='libudev.so.0 compatibility library for systems with newer udev versions'
url='https://github.com/archlinux/libudev0-shim'
arch=('x86_64')
license=('GPL')
provides=('libudev0')
conflicts=('libudev0')
depends=('systemd-libs')
source=(${pkgname}.tar.gz::https://github.com/archlinux/libudev0-shim/archive/v${pkgver}.tar.gz)
sha512sums=('794810b20be6391cb6af53c2c49705f8bd884dd6eb5d1fd5b659481a01490205cc60e0f1904c020fb0e59e984583762ba6775f977a78b95a40ba82eb93965387')

build() {
  cd ${pkgname}-${pkgver}
  unset LDFLAGS
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 libudev.so.0.0.9999 -t "${pkgdir}/usr/lib"
  ln -s libudev.so.0.0.9999 "${pkgdir}/usr/lib/libudev.so.0"
}

# vim: ts=2 sw=2 et:
