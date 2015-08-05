# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=kcalc-kde4
pkgver=4.14.3
pkgrel=1
pkgdesc='Scientific Calculator'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://kde.org/applications/utilities/kcalc'
license=('GPL')
groups=('kde-applications' 'kdeutils')
depends=('qt4' 'kdebase-lib' 'kdebase-runtime')
makedepends=('make' 'gcc' 'cmake' 'git' 'automoc4')
conflicts=('kcalc' 'kdeutils-kcalc')
provides=('kcalc')
source=("http://download.kde.org/stable/${pkgver}/src/kcalc-${pkgver}.tar.xz")
sha1sums=('0990a35d1fe97b4d4157b6ce6d8e13d199934dad')
install=$pkgname.install

prepare()
{
	mkdir -p build
}

build()
{
	cd build
	cmake ../kcalc-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF
	make
}

package()
{
	cd build
	make DESTDIR="${pkgdir}" install
}
