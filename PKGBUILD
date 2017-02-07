# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.5.5
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64' 'i686')
url="https://github.com/raoulh/${pkgname}"
license=('GPL3')

depends=('libusb'
         'mooltipass-udev'
         'qt5-base'
         'qt5-websockets')

makedepends=('make')
checkdepends=()
optdepends=()

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}-beta.tar.gz")
sha256sums=('7ea66a6c38822020136bae7aaa841812f9532dbfef5334f06806a1c642958d5e')

build() {
	cd "${pkgname}-${pkgver}-beta"

        mkdir build
        cd build/

        qmake-qt5 ../Moolticute.pro                     \
                  PREFIX=/usr                           \
                  QMAKE_CFLAGS_RELEASE="${CFLAGS}"      \
                  QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"

        make
}

package() {
	cd "${pkgname}-${pkgver}-beta/build/"
        pwd

	make INSTALL_ROOT="${pkgdir}/" install

        # temporary remove udev rules until fully merged into mooltipass-udev
        rm -rf "${pkgdir}/usr/lib/udev/"
}
