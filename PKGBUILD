# Maintainer: Joel Teichroeb <joel@teichroeb.net>

_pkgname=residualvm
pkgname=${_pkgname}-git
pkgver=r7855.626c55780
pkgrel=1
pkgdesc="A cross-platform 3D game interpreter which allows you to play LucasArts' LUA-based 3D adventures"
arch=('i686' 'x86_64')
url='http://www.residualvm.org'
conflicts=('residualvm')
license=(LGPL)
depends=(sdl2 zlib alsa-lib libmad mesa libmpeg2 freetype2
         glew libjpeg-turbo)
makedepends=(git)
source=(git://github.com/residualvm/residualvm.git)
sha1sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	./configure --prefix=/usr --enable-c++11 --enable-release
	make
}

package() {
	cd ${_pkgname}
	make DESTDIR=${pkgdir} install
    install -Dm644 "dists/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "icons/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/residualvm.png"
    install -Dm644 "icons/${_pkgname}-big.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/residualvm.png"
}
