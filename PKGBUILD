# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: <kontakt.zuf(at)gmail.com>

pkgname=panini
pkgver=0.71.104
pkgrel=6
pkgdesc='A portable panoramic image viewer with 3D rotation and perspective control, using OpenGL in the Qt framework'
url='http://sourceforge.net/projects/pvqt/'
arch=('i686' 'x86_64')
depends=('qt4' 'zlib' 'glu')
conflicts=('pvqt')
replaces=('pvqt')
license=('GPL')
source=("http://downloads.sourceforge.net/project/pvqt/panini/Panini%200.71.100/Panini-${pkgver}-src.zip"
	'panini-build.patch')
sha256sums=('aacd27a71049c5e3b953afc02ecd67fb9bfd35702255ff5cc21a96719c0c82b3'
            '609a2e6851a872ec6dce7825a415e7e549bf6ec605d6f6ee3f0853160ee62769')

prepare() {
	cd "${srcdir}/Panini-${pkgver}-src"

	patch -p1 -i ../panini-build.patch
}

build() {
	cd "${srcdir}/Panini-${pkgver}-src"

	qmake-qt4
	make release
}

package() {
	cd "${srcdir}/Panini-${pkgver}-src"

	install -D -m 0755 Panini "${pkgdir}/usr/bin/${pkgname}"
}
