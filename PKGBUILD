# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: <kontakt.zuf(at)gmail.com>

pkgname=panini
pkgver=0.71.104
pkgrel=5
pkgdesc='A portable panoramic image viewer with 3D rotation and perspective control, using OpenGL in the Qt framework'
url='http://sourceforge.net/projects/pvqt/'
depends=('qt4' 'zlib' 'glu')
conflicts=('pvqt')
arch=('i686' 'x86_64')
replaces=('pvqt')
source=("http://downloads.sourceforge.net/project/pvqt/panini/Panini%200.71.100/Panini-${pkgver}-src.zip"
	'panini-build.patch')
license=('GPL')
md5sums=('217fd8445088c5ffd24ccd5cb8d575df'
         '9da749019fe27695636cebbd4cbc3425')

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
