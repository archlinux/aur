# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

_pkgname=ogre
pkgname=ogre3d
pkgrel=1
pkgver=1.12.0
pkgdesc='An Open-Source 3D Game Engine written in C++'
url="https://www.ogre3d.org/"

arch=('any')
license=('MIT')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OGRECave/ogre/archive/v${pkgver}.tar.gz")

md5sums=('30dada0a5b459f011d68e46186177e0d')
sha1sums=('6e14cb98688eb7ed271205f3db98a5210d0f471a')

makedepends=("make" "cmake" "doxygen")
depends=("freetype2" "sdl2" "libxext" "zlib" "freeimage" "libxaw" "nvidia-cg-toolkit" "zziplib") 


build() 
{
	mkdir -p build
	cd build
	cmake -G"Unix Makefiles" -DOGRE_BUILD_SAMPLES=OFF -DOGRE_INSTALL_SAMPLES=OFF -DOGRE_BUILD_DEPENDENCIES=OFF -DCMAKE_INSTALL_PREFIX=/usr -DOGRE_CONFIG_THREAD_PROVIDER=std -DOGRE_USE_STD11=ON "../${_pkgname}-$pkgver/"

	make -j
}

package() 
{
	cd "$srcdir/build"
	make -j install DESTDIR="$pkgdir/"
	
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	install -m 644 "$srcdir/${_pkgname}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
