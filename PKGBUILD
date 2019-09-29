# Contributor: Alex Merry <alexmerry@kde.org>

pkgname='icemon'
pkgver=3.3
pkgrel=1
pkgdesc='Icecream GUI monitor.'
url='https://github.com/icecc/icemon'
license=('GPL')
depends=('icecream>=1.3' 'qt5-base>=5.2' 'hicolor-icon-theme')
# docbook2x required for man page generation
makedepends=('cmake' 'docbook2x' 'extra-cmake-modules')
provides=('icemon')
conflicts=('icemon-git')
arch=('x86_64')
install=icemon.install
source=("https://github.com/icecc/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3caf14731313c99967f6e4e11ff261b061e4e3d0c7ef7565e89b12e0307814ca')

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
