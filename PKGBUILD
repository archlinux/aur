# Maintainer: gehenna14 <bernkastel1337@disroot.org>
# Contributor: e5ten <e5ten.arch@gmail.com>
# Contributor: sxe <sxxe@gmx.de>
pkgname='qlipper'
pkgver=6.1.0
pkgrel=1
pkgdesc='Lightweight & cross-platform clipboard history applet based on Qt'
arch=('i686' 'x86_64')
url="https://github.com/pvanek/${pkgname}"
license=('GPL2')
depends=('qt6-base' 'kguiaddons')
makedepends=('cmake' 'ninja' 'qt6-tools' 'git')
source=("git+https://github.com/pvanek/${pkgname}#tag=${pkgver}")
sha256sums=('41dff93cd8273a4170b27925b475f62962dcdedb968f78a66bb67283471d0e01')

build() {
    cmake -G 'Ninja' -B "${srcdir}/build" \
		-DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        	-DCMAKE_BUILD_TYPE:STRING='Release' \
		"${srcdir}/${pkgname}"
    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
}

