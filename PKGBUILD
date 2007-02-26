# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

pkgname=olsrd-plugins
pkgver=0.4.10
pkgrel=1
pkgdesc="OLSR daemon is an implementation of the Optimized Link State Routing protocol. The plugins allow to add or extend some of its functionnalities."
url="http://www.olsr.org"
license=""
depends=('glibc' 'olsrd')
install=
source=(http://www.olsr.org/releases/0.4/olsrd-$pkgver.tar.gz)
md5sums=('cb6313649d19b05e5d8d5eaf866bb98d')


build() {
	cd $startdir/src/olsrd-$pkgver
	plugins=`find lib -maxdepth 1 -type d | sed -e "s#lib/\?##g"`
	for plug in ${plugins}; do
		make OS=linux -C lib/$plug || return 1
	done
	for plug in ${plugins}; do
		make OS=linux INSTALL_PREFIX=$startdir/pkg -C lib/$plug install || return 1
	done
}
