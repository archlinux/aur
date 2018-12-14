# Contributor: Alex Merry <alexmerry@kde.org>

pkgname='icemon'
pkgver=3.2.0
pkgrel=1
pkgdesc='Icecream GUI monitor.'
url='https://github.com/icecc/icemon'
license=('GPL')
depends=('icecream' 'qt5-base>=5.2' 'hicolor-icon-theme')
# docbook2x required for man page generation
makedepends=('cmake' 'docbook2x')
provides=('icemon')
conflicts=('icemon-git')
arch=('x86_64')
install=icemon.install
source=("https://github.com/icecc/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b7ed29c3638c93fbc974d56c85afbf0bfeca6c37ed0522af57415a072839b448')

build() {
    mkdir -p build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -D_docbook_to_man_executable=/usr/bin/docbook2man \
          "../${pkgname}-${pkgver}"
    make
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install
}
