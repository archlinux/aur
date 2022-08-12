# Maintainer: Angel Sartonev <work@asart.bg>
pkgname=fwknop-gui
pkgver=1.3.release.r6.g1fadc5c
pkgrel=1
pkgdesc='Official desktop client for the fwknop daemon'
url='https://incomsystems.biz/fwknop-gui/'
license=('GPL3')
arch=('i686' 'x86_64')
depends=(fwknop wxwidgets qrencode)
provides=(fwknop-gui)
conflicts=(fwknop-gui)
makedepends=(git cmake asciidoc)
optdepends=()
source=(git+https://github.com/jp-bennett/fwknop-gui.git)
pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP')
build() { 
	cmake \
            -B "${srcdir}/${pkgname}" \
            -S "${srcdir}/${pkgname}" \
            -DCMAKE_INSTALL_PREFIX:PATH='/usr'
	make -C "${srcdir}/${pkgname}"
}
package() {
        make -C "${srcdir}/${pkgname}" DESTDIR="${pkgdir}" install
}

