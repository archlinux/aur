# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=kcalc-kde4
pkgver=4.4.5
pkgrel=1
pkgdesc='Scientific Calculator - the best version with small key shortcut patch'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://kde.org/applications/utilities/kcalc'
license=('GPL')
groups=('kde' 'kdeutils')
depends=('qt4' 'kdebase-lib' 'kdebase-runtime')
makedepends=('make' 'gcc' 'cmake' 'automoc4')
conflicts=('kcalc' 'kdeutils-kcalc')
provides=('kcalc')
source=(
	"http://download.kde.org/Attic/${pkgver}/src/kdeutils-${pkgver}.tar.bz2"
	"ShortcutConflict.patch"
	"kDebug.patch")
sha1sums=(
	'c092cfbb46719d89a5718735dc81ca75c0176e45'
	'8a496131fd81e561ef7ac8a8e64c2a713ae05963'
	'08109de9ce8f177cf26270312369a3014241743f'
)
install=$pkgname.install

prepare()
{
	mkdir -p build
}

build()
{
	patch -p0 < ShortcutConflict.patch
	patch -p0 < kDebug.patch
	cd build
	cmake ../kdeutils-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF
	cd kcalc
	make
}

package()
{
	cd build/kcalc
	make DESTDIR="${pkgdir}" install
}
