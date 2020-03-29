# Maintainer: Amy <amy@fluff.tech>

pkgname=unnamed-sdvx-clone-git
pkgver=v0.4.r186.g616af505
pkgrel=1
pkgdesc='A game based on K-Shoot MANIA and Sound Voltex'
arch=('i686' 'x86_64')
url='https://github.com/Drewol/unnamed-sdvx-clone'
license=('MIT')
provides=('unnamed-sdvx-clone')
conflicts=('unnamed-sdvx-clone')
makedepends=('git' 'cmake>=3.4')
depends=('freetype2>=2.6.5'
         'libogg'
         'libvorbis'
         'sdl2>=2.0.9'
         'zlib'
         'libpng>=1.6'
         'libjpeg-turbo'
         'libarchive>=3.3.3'
         'mesa'
         'openssl')
install="${pkgname}.install"
source=('git+https://github.com/Drewol/unnamed-sdvx-clone')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/unnamed-sdvx-clone"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/unnamed-sdvx-clone"
	
	git submodule update --init --recursive
	
	cmake -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "${srcdir}/unnamed-sdvx-clone"
	
	mkdir -p "${pkgdir}/opt/unnamed-sdvx-clone"
	mkdir -p "${pkgdir}/usr/bin"
	
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	
	cp -dr "bin/." "${pkgdir}/opt/unnamed-sdvx-clone"
	
	ln -s "/opt/unnamed-sdvx-clone/usc-game" "${pkgdir}/usr/bin/usc-game"
	
	chmod 777 "${pkgdir}/opt/unnamed-sdvx-clone"
	chmod 777 "${pkgdir}/opt/unnamed-sdvx-clone/skins"
	chmod 777 "${pkgdir}/opt/unnamed-sdvx-clone/skins/Default"
}
