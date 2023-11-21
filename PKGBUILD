# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=naikari
pkgver=0.11.0
pkgrel=1
pkgdesc="Freeform 2-D space trading and mercenary game."
arch=('x86_64')
url="https://naikari.github.io/"
license=('GPL3')
depends=('sdl2_image' 'libxml2' 'freetype2' 'libpng' 'openal' 'libvorbis' 'libgl' 'luajit' 'suitesparse' 'libunibreak' 'physfs')
makedepends=('meson' 'ninja')
provides=('naikari')
conflicts=('naikari' 'naikari-git')
source=("https://github.com/naikari/naikari/releases/download/v${pkgver}/${pkgname}-${pkgver}-source.tar.xz")
md5sums=('d207011e2ded7a1a7915e01ea0fbd504')

prepare() {
	mv ${srcdir}/${pkgname}-${pkgver} ${srcdir}/${pkgname}
}

build() {
	cd ${srcdir}/${pkgname}
	meson setup build .
	cd build
	meson configure --buildtype=release -Db_lto=true --prefix=/usr
	meson compile
}

package() {
	cd ${srcdir}/${pkgname}
	DESTDIR=${pkgdir} meson install -C build
	install -D LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
