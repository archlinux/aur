# Maintainer: e5ten <e5ten.arch@gmail.com>
# Contributor: sxe <sxxe@gmx.de>
pkgname='qlipper'
pkgver=5.1.1
pkgrel=2
pkgdesc='Lightweight & cross-platform clipboard history applet based on qt'
arch=('i686' 'x86_64')
url="https://github.com/pvanek/${pkgname}/"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'ninja' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pvanek/qlipper/archive/${pkgver}.tar.gz")
sha512sums=('196e3a348028d4b0f52362a1c0cfb0c479a31b6b56af5c5423db91af2ecc926eee1c9da385171b2084e1a7b6e919d94d1c1626fa128636b4075a00bbc5351586')

prepare() {
	mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"
    cmake -G "Ninja" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		"../${pkgname}-${pkgver}"
    ninja
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" ninja install
}
