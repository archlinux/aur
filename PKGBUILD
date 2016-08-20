# $Id$
# Maintainer: MArkus Kitsinger <root@swooshalicio.us>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: PelPix <kylebloss@pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=lib32-libfdk-aac
pkgver=0.1.4
pkgrel=1
pkgdesc='Fraunhofer FDK AAC codec library (32-bit)'
arch=('x86_64')
url='http://sourceforge.net/projects/opencore-amr/'
license=('custom')
depends=('glibc')
provides=('libfdk-aac.so')
source=("http://downloads.sourceforge.net/opencore-amr/fdk-aac-${pkgver}.tar.gz")
sha256sums=('5910fe788677ca13532e3f47b7afaa01d72334d46a2d5e1d1f080f1173ff15ab')

build() {
  cd fdk-aac-${pkgver}

  CC='gcc -m32' CXX='g++ -m32' CXXFLAGS='-Wno-narrowing -O2'  ./configure \
    --prefix='/usr' \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

package () {
  cd fdk-aac-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
}

# vim: ts=2 sw=2 et:
