# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Woody Gilk aka Shadowhand <woody.gilk@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Richard Gill <richard@houbathecat.fr>

pkgname=gmrun-xdg
_pkgname=gmrun
pkgver=0.9.2
pkgrel=5
pkgdesc="A simple program which provides a run program window (XDG aware)"
arch=('i686' 'x86_64')
url="http://sf.net/projects/gmrun"
license=('GPL')
conflicts=(${_pkgname})
replaces=(${_pkgname})
depends=('gtk2' 'popt')
source=(http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz
	gcc43.patch
	${_pkgname}-${pkgver}-xdg.patch)
md5sums=('6cef37a968006d9496fc56a7099c603c'
	 '3a0b69d8c2cac6cfb551b9d235441ecb'
	 'ffe92ec406269b94dd4d23e41488c04d')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p0 -i ../gcc43.patch
  patch -Np1 -i ../${_pkgname}-${pkgver}-xdg.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
} 
