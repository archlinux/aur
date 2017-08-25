# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-iptvsimple
pkgver=2.4.14
pkgrel=1
pkgdesc='IPTV Simple PVR client addon for Kodi'
_koditarget=Krypton
_gitname=pvr.iptvsimple
_kodiver=17.4
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform')
conflicts=('kodi-addon-pvr-iptvsimple-git');
depends=('kodi' 'git')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('329bd71e5c786d7b037bf5fd103ee4abff892afc6e5186a5d0a797194a8c4c7c'
            'b05e11b2d108222bfc3ff0c9a466d798c0feedf1228166239948e6ed37c3cb4f')

build() {
	mkdir -p "pvr.iptvsimple-${pkgver}-${_koditarget}/build"
	cd "pvr.iptvsimple-${pkgver}-${_koditarget}/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		-DADDONS_TO_BUILD=pvr.iptvsimple \
		-DADDONS_SRC_PREFIX=../.. \
		../../xbmc-${_kodiver}-${_koditarget}/project/cmake/addons
	make
}
        
package() {
	cd "pvr.iptvsimple-${pkgver}-${_koditarget}/build"
	install -d "${pkgdir}/usr"
	mv .install/lib "${pkgdir}/usr/"
	mv .install/share "${pkgdir}/usr/"
}
