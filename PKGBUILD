# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=kate-kde4
pkgver=4.14.3
pkgrel=1
pkgdesc='Advanced Text Editor'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://www.kde.org/applications/utilities/kate'
license=('GPL')
groups=('kde' 'kdesdk')
depends=('qt4' 'kdebase-lib' 'kdebase-runtime')
makedepends=('make' 'gcc' 'cmake' 'git' 'automoc4')
conflicts=('kate' 'kwrite', 'kdesdk-kate' 'kdebase-kwrite' 'kdebase-katepart')
provides=('kate' 'kwrite' 'kdebase-katepart' 'katepart4')
source=("http://download.kde.org/stable/${pkgver}/src/kate-${pkgver}.tar.xz")
sha1sums=('da37195e86b5449fcdfe69a3f7df6373a5da900c')
install=$pkgname.install

prepare()
{
	mkdir -p build
}

build()
{
	cd build
	cmake ../kate-${pkgver} \
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
