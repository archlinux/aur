_pkgname=ogre
pkgname=ogre3d
pkgrel=1
pkgver=1.10.11
pkgdesc='An Open-Source 3D Game Engine written in C++'
url="https://www.ogre3d.org/"

arch=('any')
license=('MIT')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OGRECave/ogre/archive/v1.10.11.tar.gz")
md5sums=('3a7ec7cbdf36b7a204832bd3763683b2')
sha1sums=('a77756423960a44db8260db67a82589e979e1081')

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
