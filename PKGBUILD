# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=volume_key
pkgver=0.3.9
pkgrel=2
pkgdesc='library for manipulating storage volume encryption keys'
arch=('x86_64' 'i686')
depends=('cryptsetup' 'python2')
license=('GPL')
url='https://fedorahosted.org/volume_key/'
source=("https://fedorahosted.org/releases/v/o/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('450a54fe9bf56acec6850c1e71371d3e4913c9ca1ef0cdc3a517b4b6910412a6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	export PYTHON=/usr/bin/python2
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	sed -i '/#include <config.h>/d' lib/libvolume_key.h

	make DESTDIR="${pkgdir}" install
}

