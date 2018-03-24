pkgname=oacapture
pkgver=1.4.0
pkgrel=1
pkgdesc="A planetary imaging application using Qt5"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt5-base' 'qt5-tools' 'cfitsio' 'autoconf-archive')
url="http://www.openastroproject.org/oacapture/"
optdepends=('fxload: support for QHY5 cameras')

source=("https://github.com/openastroproject/openastro/archive/v1.4.0.tar.gz" "oacapture-slash-lib.diff")
sha1sums=("921dddfcdd0ae91de273c770f8b79c567ff197b6" "9fc44f9fbc00c8da87a9b6b0dbb6e8dee3e9bdc1")

build() {
	cd "openastro-${pkgver}"
	patch -Np1 < ${srcdir}/oacapture-slash-lib.diff
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "openastro-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# remove unwanted files
	rm -rf ${pkgdir}/usr/include
        rm -rf ${pkgdir}/usr/lib/*.a
        rm -rf ${pkgdir}/usr/lib/pkgconfig
        rm -rf ${pkgdir}/usr/share/doc/hidapi
}

