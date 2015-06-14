# Maintainer: Alex Merry <alexmerry@kde.org>

pkgname='icemon'
pkgver=3.0.0
pkgrel=2
pkgdesc='Icecream GUI monitor.'
url='https://github.com/icecc/icemon'
license=('GPL')
depends=('icecc' 'qt5-base>=5.2')
# docbook2x required for man page generation
makedepends=('cmake' 'docbook2x')
provides=('icemon')
conflicts=('icemon-git')
arch=('i686' 'x86_64')
source=('https://github.com/icecc/icemon/archive/v3.0.0.tar.gz')
md5sums=('7ba23d812db4bdd32d52e947c5749217')

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
