# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Light2Yellow <alexvilchansky@yahoo.com>
# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: V0K3 <v0k3@inventati.org>

pkgname=sasm
pkgver=3.11.1
pkgrel=1
pkgdesc="Simple crossplatform IDE for NASM, GAS, FASM assembly languages"
arch=('i686' 'x86_64')
url="http://dman95.github.io/SASM/english.html"
license=('GPL3')
depends=('qt5-base' 'nasm' 'gdb' 'gcc' 'fasm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dman95/SASM/archive/v${pkgver}.tar.gz")
sha256sums=('3f508f2a790815aca4e742be1e1200aea1d25f6f73309ce824d5ccef49af26b1')

build() {
    cd "${srcdir}/${pkgname^^}-${pkgver}"
    qmake PREFIX="/usr"
    make
}

package() {
    cd "${srcdir}/${pkgname^^}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
    # Don't provide fasm in the package, require it instead
    rm "${pkgdir}"/usr/bin/fasm
}
