# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=naikari
pkgver=0.5.0
pkgrel=1
pkgdesc="2-D space trading and mercenary game forked from the Naev project."
arch=('x86_64')
url="https://naikari.github.io/"
license=('GPL3')
depends=('sdl2_image' 'libxml2' 'freetype2' 'libpng' 'openal' 'libvorbis' 'libgl' 'luajit' 'suitesparse' 'libunibreak' 'physfs' 'glpk')
makedepends=('meson' 'ninja')
provides=('naikari')
conflicts=('naikari' 'naikari-git')
source=("https://github.com/naikari/naikari/releases/download/v${pkgver}/${pkgname}-${pkgver}-source.tar.xz")
md5sums=('fc1de4b30be41c42392d66792d930288')

prepare() {
	mv ${srcdir}/${pkgname}-${pkgver} ${srcdir}/${pkgname}
	cd ${srcdir}/${pkgname}
	meson setup build .
	cd build
	meson configure --buildtype=release -Db_lto=true --prefix=/usr
	meson compile
}

package() {
	cd ${srcdir}/${pkgname}
	DESTDIR=${pkgdir} meson install -C build
}
