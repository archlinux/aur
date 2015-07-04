# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
pkgname=drm_tools
pkgver=1.1.24
pkgrel=1
pkgdesc="Collection of small command line tools that are sometimes helpful in specific instances." 
url="http://drmtools.sourceforge.net/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('pcre')
conflicts=('libextractor')
changelog=Changelog
source=("http://sourceforge.net/projects/drmtools/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('0e790163f06262329b1ad4979d0a3d9b')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}/

	# do not install using build_linux.sh
	sed -i '/$PROGCP/d' build_linux.sh
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	./build_linux.sh
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/

	# binaries
	install -dm755 ${pkgdir}/usr/bin
	install -m755 \
		accudate \
		binreplace \
		columnadd \
		datasniffer \
		dmath \
		execinput \
		extract \
		mbin \
		mbout \
		mdump \
		msgqueue \
		pockmark \
		${pkgdir}/usr/bin/

	# man pages
	install -dm755 ${pkgdir}/usr/share/man/man1
	install -m644 *.1 ${pkgdir}/usr/share/man/man1/

	# readme
	install -Dm644 README.TXT ${pkgdir}/usr/share/doc/${pkgname}/README.TXT

	# man pages in HTML
	#install -m644 *.html ${pkgdir}/usr/share/doc/${pkgname}

	# tests
	#install -dm755 ${pkgdir}/usr/share/${pkgname}
	#install -m755 test_* ${pkgdir}/usr/share/${pkgname}
}
