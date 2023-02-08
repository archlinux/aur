# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Light2Yellow <alexvilchansky@yahoo.com>
# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: V0K3 <v0k3@inventati.org>

pkgname=sasm
pkgver=3.13.2
pkgrel=1
pkgdesc="Simple crossplatform IDE for NASM, GAS, FASM assembly languages"
arch=('i686' 'x86_64')
url="http://dman95.github.io/SASM/english.html"
license=('GPL3')
depends=('qt5-base' 'nasm' 'gdb' 'gcc' 'fasm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dman95/SASM/archive/v${pkgver}.tar.gz")
sha256sums=('05d74b4f8c5f24d3d36a0a366e814745762b9575a813f4348cb98783aeef7e8f')

build() {
    cd "${pkgname^^}-${pkgver}"
    qmake PREFIX=/usr
    make
}

package() {
    cd "${pkgname^^}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
    # Don't provide fasm in the package, require it instead
    rm "${pkgdir}"/usr/bin/fasm
}
