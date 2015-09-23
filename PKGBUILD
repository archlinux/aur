# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=ark-kde4
pkgver=15.04.3
pkgrel=1
pkgdesc='Archiving Tool'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://kde.org/applications/utilities/ark'
license=('GPL')
groups=('kde' 'kdeutils')
depends=('kdebase-runtime' 'kdebase-lib' 'libarchive' 'qjson')
makedepends=('make' 'gcc' 'cmake' 'automoc4')
conflicts=('ark' 'kdeutils-ark')
provides=('ark')
source=("http://download.kde.org/stable/applications/${pkgver}/src/ark-${pkgver}.tar.xz")
sha1sums=('891187b1c49258ab461f1dcbfae82f0640a96f54')
install=$pkgname.install

prepare()
{
	mkdir -p build
}

build()
{
	cd build
	cmake ../ark-${pkgver} \
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
