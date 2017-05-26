# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-iptvsimple
pkgver=2.4.11
pkgrel=3
pkgdesc='IPTV Simple PVR client addon for Kodi'
_koditarget=Krypton
_gitname=pvr.iptvsimple
_kodiver=17.3
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
sha256sums=('0a006e275cddba02d5d3fd22a95cec6411a765719509a9bc8fcc93dfa247bd4c'
            '1de8653a3729cefd1baaf09ecde5ace01a1e3a58fbf29d48c1363f2503d331a1')

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
