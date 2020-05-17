# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: foxbunny <bg.branko@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=gimp-plugin-separate+
pkgver=0.5.8
pkgrel=5
pkgdesc='Provides some useful color-management functions for the GIMP'
arch=('i686' 'x86_64')
url='http://cue.yellowmagic.info/softwares/separate-plus/'
license=('GPL2')
depends=('gimp' 'lcms')
makedepends=('unzip')
optdepends=('adobe-icc: ICC profiles from Adobe'
            'eci-icc: ICC profiles from ECI')
provides=('gimp-plugin-separate')
source=("http://dl.sourceforge.jp/separate-plus/47873/separate+-${pkgver}.zip")
b2sums=('2fa21ee4b911f4973c6c1f33b5cae34e3a0e5a45a27e95042fe84d19c1701f7a52693539f6e9388e14fe778b3a84d90b370ebb0fc795a5af128a5bd27190d893')

prepare() {
	cd "separate+-${pkgver}"
	sed '/LIBS/s/$/ -lm/' -i Makefile
}

build() {
	cd "separate+-${pkgver}"
	make
}

package() {
	cd "separate+-${pkgver}"
	make PREFIX="${pkgdir}"/usr install

	install -dm755 "${pkgdir}"/usr/share/gimp/2.0/scripts
	install -m644 sample-scripts/* "${pkgdir}"/usr/share/gimp/2.0/scripts
}
