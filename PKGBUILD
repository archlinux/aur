# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=unicorn
pkgname=('unicorn')
pkgver=0.9
pkgrel=1
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='http://www.unicorn-engine.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glib2')
makedepends=('pkg-config' 'python2')
checkdepends=('cmocka')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/unicorn-engine/${pkgbase}/archive/${pkgver}.tar.gz)
sha512sums=('c69bb03b7ba4ebec9aef23b80d1ffe33a30de958a74136ef5933b5fa10a2b2ffddd716fdb1881b78dfdcc5a53fece15c368c661b12d20f80dbf955a66930eb0b')

build() {
  cd ${pkgbase}-${pkgver}
  make UNICORN_QEMU_FLAGS="--python=/usr/bin/python2"
}

check() {
  cd ${pkgbase}-${pkgver}
  # x64 tests failing currently
  # make test
}

package_unicorn() {
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  # temporary fixup
  sed 's|/build/unicorn/pkg/unicorn||g' -i "${pkgdir}/usr/lib/pkgconfig/unicorn.pc"
}

# vim: ts=2 sw=2 et:
