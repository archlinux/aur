# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: foxbunny <bg.branko@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=gimp-plugin-separate+
pkgver=0.5.8
pkgrel=3
pkgdesc='Provides some useful color-management functions for the GIMP'
arch=('i686' 'x86_64')
url='http://cue.yellowmagic.info/softwares/separate-plus/'
license=('GPL2')
depends=('gimp' 'lcms')
makedepends=('unzip')
optdepends=('adobe-icc: ICC profiles from Adobe'
            'eci-icc: ICC profiles from ECI')
source=("http://dl.sourceforge.jp/separate-plus/47873/separate+-${pkgver}.zip")
sha1sums=('ca109eb5c85e91f062e747a710142888efcf85b8')

replaces=('gimp-plugin-separate')

build() {
	cd "${srcdir}/separate+-${pkgver}"
	sed '/LIBS/s/$/ -lm/' -i Makefile
	make
}

package() {
	cd "${srcdir}/separate+-${pkgver}"
	make PREFIX="${pkgdir}"/usr install

	install -d "${pkgdir}"/usr/share/gimp/2.0/scripts
	install -m644 sample-scripts/* "${pkgdir}"/usr/share/gimp/2.0/scripts
}
