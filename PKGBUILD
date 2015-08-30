# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=dolphin-kde4
pkgver=4.14.3
pkgrel=1
pkgdesc='File Manager'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://kde.org/applications/system/dolphin'
license=('GPL')
groups=('kde-applications' 'kdebase')
depends=('qt4' 'kdebase-lib' 'kdebase-runtime' 'kdelibs4support' 'knotifyconfig')
makedepends=('make' 'gcc' 'cmake' 'automoc4')
conflicts=('dolphin' 'kdebase-dolphin' 'dolphinpart4')
provides=('dolphin' 'dolphinpart4')
source=("http://download.kde.org/stable/${pkgver}/src/kde-baseapps-${pkgver}.tar.xz")
sha1sums=('c4e28755454e1925b96eaf5374ca5c2f6c8bd9c8')
install=$pkgname.install

prepare()
{
	mkdir -p build
}

build()
{
	cd build
	cmake ../kde-baseapps-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF
	cd dolphin
	make
}

package()
{
	cd build/dolphin
	make DESTDIR="${pkgdir}" install
}
