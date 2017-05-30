# $Id$
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Sven Kauber, <celeon@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Star Brilliant <m13253@hotmail.com>
# Contributor: Edlmann <edlmann.mw2@gmx.de>

_pkgname=encfs
pkgname=encfs18
pkgver=1.8.1
pkgrel=10
pkgdesc='Encrypted filesystem in user-space (without issue #214)'
arch=('i686' 'x86_64')
url='https://vgough.github.io/encfs/'
license=('LGPL')
depends=('rlog' 'openssl' 'fuse2' 'boost-libs')
provides=('encfs')
conflicts=('encfs')
makedepends=('boost' 'autoconf')
source=($_pkgname-$pkgver.tar.gz::https://github.com/vgough/$_pkgname/archive/v$pkgver.tar.gz encfs18-openssl-1.1.patch)
sha256sums=('ed6b69d8aba06382ad01116bbce2e4ad49f8de85cdf4e2fab7ee4ac82af537e9'
            'SKIP')


prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
  # fix build with openssl 1.1 (Debian)
  patch -p1 -i ../encfs18-openssl-1.1.patch
}

build(){
  cd "${srcdir}"/$_pkgname-$pkgver

  autoreconf -if
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$_pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
