# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>

pkgname=virt-what
pkgver=1.20
pkgrel=1
license=('GPL')
arch=('i686' 'x86_64')
depends=('dmidecode')
pkgdesc='A small program that prints out a list of facts about a virtual machine'
url='http://people.redhat.com/~rjones/virt-what/'
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
source=("http://people.redhat.com/~rjones/virt-what/files/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('f913dcd29add5121e3ffc0f2d0f17e19ff3183e8ab8ca417a5b6be43787910e8'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure
	sed -i '/^sbindir/c sbindir = /usr/bin' Makefile
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make libexecdir=/usr/bin prefix=/usr DESTDIR=${pkgdir} install
}

