# Submitter: Gavin Lloyd <gavinhungry@gmail.com>
# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=gqrx-scanner
pkgver=1.0.6
pkgrel=1
pkgdesc="A frequency scanner for Gqrx Software Defined Radio receiver"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/neural75/gqrx-scanner"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
optdepends=('gqrx: Software Defined Radio receiver')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('259392406ca15393c17abaacb6bd002bd6a2cceb62677bc48a98cbbad0b9c342')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
