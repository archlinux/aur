# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=1.6.7
pkgrel=2
pkgdesc='3D video player with multi-display support'
arch=('i686' 'x86_64')
url='https://bino3d.org/'
license=('GPL3')
depends=('ffmpeg' 'freealut' 'freeglut' 'glewmx' 'libass' 'qt5-base')
optdepends=('lirc: infrared remote control')
source=(00700a3.patch https://bino3d.org/releases/bino-1.6.7.tar.xz{,.sig})
sha512sums=('2923f3818cbbf979e5ba77d731a5d05525472a8ac7419a716bf2b298af6c8fe21f87fb63653460c729169ec76497a9a300d646cd308fd905e730d4fc65140ac8'
	'ae8f72b200100664b9fd55963371ce64a2f39e240676494d69b422d662f2295560ba458eb04707b82f88d3c6b3fab98a1ecb40d74799300f96b8eb8be680c9b8'
	'SKIP')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../00700a3.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
	  --prefix=/usr \
	  --with-qt-version=5 \
	  #--with-xnvctrl # Enable NVIDIA Quadro SDI output
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
