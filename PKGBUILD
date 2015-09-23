# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=konsole-kde4
pkgver=4.14.3
pkgrel=2
pkgdesc='Terminal'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://kde.org/applications/system/konsole'
license=('GPL')
groups=('kde-applications' 'kdebase')
depends=('qt4' 'kdebase-lib' 'kdebase-runtime')
makedepends=('make' 'gcc' 'cmake' 'automoc4')
conflicts=('konsole' 'kdebase-konsole' 'konsolepart4')
provides=('konsole' 'konsolepart4')
source=("http://download.kde.org/stable/${pkgver}/src/konsole-${pkgver}.tar.xz")
sha1sums=('5ae78061f38f06f80ee10f4475ff33d1c0843b4d')
install=$pkgname.install

prepare()
{
	mkdir -p build
}

build()
{
	cd build
	cmake ../konsole-${pkgver} \
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
