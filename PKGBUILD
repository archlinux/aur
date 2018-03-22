# $Id$
# Maintainer: MArkus Kitsinger <root@swooshalicio.us>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: PelPix <kylebloss@pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=lib32-libfdk-aac
pkgver=0.1.6
pkgrel=1
pkgdesc='Fraunhofer FDK AAC codec library (32-bit)'
arch=('x86_64')
url='http://sourceforge.net/projects/opencore-amr/'
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('lib32-libfdk-aac.so')
_commit='a30bfced6b6d6d976c728552d247cb30dd86e238'
source=("git+https://github.com/mstorsjo/fdk-aac.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd fdk-aac

  git describe | sed 's/^v//; s/-/.r/; s/-g/./'
}

build() {
  cd fdk-aac

  ./autogen.sh
  CC='gcc -m32' CXX='g++ -m32' CXXFLAGS='-Wno-narrowing -O2'  ./configure \
    --prefix='/usr' \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

package () {
  cd fdk-aac

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
}

# vim: ts=2 sw=2 et:
