# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-iptvsimple
pkgver=2.4.8
pkgrel=2
pkgdesc='IPTV Simple PVR client addon for Kodi'
_koditarget=Krypton
_gitname=pvr.iptvsimple
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform')
conflicts=('kodi-addon-pvr-iptvsimple-git');
depends=('kodi' 'git')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/17.0-${_koditarget}.tar.gz"
)
sha256sums=('077f57a147d0036a0a6cfee1a2c53cd384c2cc7d29942dcc5d4c715943f7cd8b'
            '4bfffa2493973ae15ab1d922632c09a2583908d6140bc4f58ec8f9314e4f6545')

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
		../../xbmc-17.0-Krypton/project/cmake/addons
	make
}
        
package() {
	cd "pvr.iptvsimple-${pkgver}-${_koditarget}/build"
	install -d "${pkgdir}/usr"
	mv .install/lib "${pkgdir}/usr/"
	mv .install/share "${pkgdir}/usr/"
}
