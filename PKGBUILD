# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: foxbunny <bg.branko@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=gimp-plugin-separate+
pkgver=0.5.8
pkgrel=4
pkgdesc='Provides some useful color-management functions for the GIMP'
arch=('i686' 'x86_64')
url='http://cue.yellowmagic.info/softwares/separate-plus/'
license=('GPL2')
depends=('gimp' 'lcms')
makedepends=('unzip')
optdepends=('adobe-icc: ICC profiles from Adobe'
            'eci-icc: ICC profiles from ECI')
conflicts=('gimp-plugin-separate')
replaces=('gimp-plugin-separate')
source=(http://dl.sourceforge.jp/separate-plus/47873/separate+-${pkgver}.zip)
sha512sums=('1e2ecf00ff6e604d0a04337ebf25ca9370e2d46d302d3fca7b7df577c37983f870704ad6018c03152bcba3bcddda59a4acceb35b3ba5d0bfd589fa1e99413aa3')

build() {
	cd "separate+-${pkgver}"
	sed '/LIBS/s/$/ -lm/' -i Makefile
	make
}

package() {
	cd "separate+-${pkgver}"
	make PREFIX="${pkgdir}"/usr install

	install -dm755 "${pkgdir}"/usr/share/gimp/2.0/scripts
	install -m644 sample-scripts/* "${pkgdir}"/usr/share/gimp/2.0/scripts
}
