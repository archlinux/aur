# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

_pkgname=ogre
pkgname=ogre3d
pkgrel=1
pkgver=1.11.5
pkgdesc='An Open-Source 3D Game Engine written in C++'
url="https://www.ogre3d.org/"

arch=('any')
license=('MIT')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OGRECave/ogre/archive/v${pkgver}.tar.gz")
md5sums=('1b4328a3317dbc857d9f969af3bf1b9d')
sha1sums=('230ce0ea3ee07f9cb4994d505636de592dc449b2')

makedepends=("make" "cmake")
depends=("freetype2" "sdl2" "libxext" "zlib" "freeimage")

build() 
{
	mkdir -p build
	cd build
	cmake -G"Unix Makefiles" -DOGRE_BUILD_SAMPLES=OFF -DOGRE_INSTALL_SAMPLES=OFF -DOGRE_BUILD_DEPENDENCIES=OFF -DCMAKE_INSTALL_PREFIX=/usr -DOGRE_CONFIG_THREAD_PROVIDER=std -DOGRE_USE_STD11=ON "../${_pkgname}-$pkgver/"

	make -j4
}

package() 
{
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir/"
	
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	install -m 644 "$srcdir/${_pkgname}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
