# Contributor: Stefan J. Betz <info@stefan-betz.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Maintainer: N. Izumi
pkgname=dar
pkgver=2.4.17
pkgrel=1
pkgdesc='A full featured command-line backup tool, short for Disk ARchive'
arch=('i686' 'x86_64')
url='http://dar.linux.free.fr/'
license=('GPL')
depends=('libgcrypt' 'zlib' 'lzo' 'bzip2' 'attr')
optdepends=('perl: for running some samples')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
backup=('etc/darrc')
options=('!libtool')
sha1sums=('b0a5b87ead362baf21190899d34766aa65d76bba')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	if [[ "${CARCH}" == x86_64 ]];then
		EXTRA_OPTIONS="--enable-mode=64"
	elif [[ "${CARCH}" == i686 ]];then
		EXTRA_OPTIONS="--enable-mode=32"
	fi
	./configure --prefix=/usr --sysconfdir=/etc --disable-dar-static --disable-static --disable-upx --disable-build-html ${EXTRA_OPTIONS}
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" pkgdatadir="/usr/share/doc/${pkgname}/html" install
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -pm644 AUTHORS ChangeLog NEWS README THANKS TODO "${pkgdir}/usr/share/doc/${pkgname}"
	rm -rf "${pkgdir}/usr/share/doc/dar/html/man"
}
