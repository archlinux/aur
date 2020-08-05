# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Alexandre Possebom <alexandrepossebom@gmail.com>

pkgname=mpack
pkgver=1.6
pkgrel=5
pkgdesc='Utilities for encoding and decoding binaries files in MIME format mail messages'
arch=('i686' 'x86_64')
url='http://ftp.andrew.cmu.edu/pub/mpack/'
license=('GPL')
# Does upstream have a new home? No idea... Let's use an archive for now.
source=("https://fossies.org/linux/misc/old/${pkgname}-${pkgver}.tar.gz"
	'gcc4-fixes.patch')
sha256sums=('274108bb3a39982a4efc14fb3a65298e66c8e71367c3dabf49338162d207a94c'
            '72cda1b1b2f28ab7d25dcefd03d8027711fd18c1bb9bf3b52eac36068f59b170')

prepare(){
	cd ${srcdir}/${pkgname}-${pkgver}

	# fix for gcc 4.x
	patch -p1 -N <../gcc4-fixes.patch

}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install
}
