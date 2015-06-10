# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Woody Gilk aka Shadowhand <woody.gilk@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Richard Gill <richard@houbathecat.fr>

pkgname=gmrun-xdg
pkgver=0.9.2
pkgrel=4
pkgdesc="A simple program which provides a run program window (XDG aware)"
arch=('i686' 'x86_64')
url="http://sf.net/projects/gmrun"
license=('GPL')
conflicts='gmrun'
replaces='gmrun'
depends=('gtk2' 'popt')
source=(http://downloads.sourceforge.net/gmrun/gmrun-$pkgver.tar.gz
	gcc43.patch gmrun-$pkgver-xdg.patch)
md5sums=('6cef37a968006d9496fc56a7099c603c'
	 '3a0b69d8c2cac6cfb551b9d235441ecb'
	 'ffe92ec406269b94dd4d23e41488c04d')

build() {
	cd "${srcdir}/gmrun-${pkgver}"

	patch -p0 -i "$srcdir/gcc43.patch"
	patch -Np1 -i "$srcdir/gmrun-$pkgver-xdg.patch"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/gmrun-${pkgver}"

	make DESTDIR="${pkgdir}" install
} 
