# Maintainer: sudoBash418 <sudoBash418 at gmail.com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

_pkgbase=fuse
pkgname=lib32-${_pkgbase}2
pkgver=2.9.9
pkgrel=1
pkgdesc="A library that makes it possible to implement a filesystem in a userspace program (32 bit)"
arch=('x86_64')
url="https://github.com/libfuse/libfuse"
license=('GPL2')
depends=('lib32-glibc' 'fuse2')
makedepends=('gcc-multilib')
provides=('lib32-fuse')
source=(${url}/releases/download/${_pkgbase}-${pkgver}/${_pkgbase}-${pkgver}.tar.gz{,.asc})
options=(!libtool)
sha256sums=('d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5'
            'SKIP')

validpgpkeys=('ED31791B2C5C1613AF388B8AD113FCAC3C4E599F')

build() {
	export CC="gcc -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd ${_pkgbase}-${pkgver}
	./configure \
		--prefix=/usr --enable-lib \
		--enable-util --libdir=/usr/lib32
	make
}

package() {
	make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}"/{dev,etc,sbin,usr/{bin,include,share}}
}
