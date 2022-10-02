# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.5.1.22
pkgrel=1
pkgdesc='Engine to run adventure/quest games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
# ags depends on Allegro 4 and do not have plans to upgrade - they intend to replace Allegro entirely with SDL.
# https://github.com/adventuregamestudio/ags/issues/403
# https://github.com/adventuregamestudio/ags/issues/762
# https://github.com/adventuregamestudio/ags/issues/1051#issuecomment-602217650
depends=('dumb-a4' 'libtheora' 'freetype2' 'sdl2' 'alsa-lib' 'jack' 'libx11' 'libxext' 'libxcursor' 'libxpm' 'libxxf86vm')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adventuregamestudio/ags/archive/v.$pkgver.tar.gz")
sha256sums=('f3af73ae3ba3ccf85c776f308cff713e989cc356a44719f7e2ede414b47e1e01')

_srcdir="$pkgname-v.$pkgver"

build() {
	cmake -S "$_srcdir" -B 'build' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG -w' \
		-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -w'
		#-DAGS_USE_LOCAL_ALL_LIBRARIES=ON \
		#-DAGS_BUILD_TOOLS=ON
	cmake --build 'build'
}

#check() {
#	cmake -S "$_srcdir" -B 'build' -DAGS_TESTS=ON
#	cmake --build 'build' --target test
#}

package() {
	#cd "ags-v.$pkgver"
	#DESTDIR="${pkgdir}" cmake --install "build"
	install -Dm755 'build/ags' -t "$pkgdir/usr/bin/"
}
