# Author: tgommes <tgommes@gmail.com>
pkgname=mustang-plug-qt5
pkgver="1.4.0"
pkgrel="1"
pkgdesc="Software for Fender Mustang Amps. Forked from piorekf/plug."
arch=('i686' 'x86_64')
url="https://gitlab.com/offa/plug"
license=('GPLv3')
depends=('qt5-base' 'libusb')
makedepends=('cmake' 'gtest' 'gmock' 'git')
provides=('mustang-plug-qt5-work')
conflicts=('mustang-plug-qt5-work')
# source=("git+git://git://gitlab.com/offa/plug")
source=("https://gitlab.com/offa/plug/-/archive/v${pkgver}/plug-v${pkgver}.tar.bz2")
md5sums=('7734568324a76aa2df668eccf7347067')

build() {
    cd "$srcdir/plug-v${pkgver}"
    mkdir build && cd build

    cmake ..
    make
    make unittest
}

package() {
    cd "$srcdir/plug-v${pkgver}/build"
    make DESTDIR="$pkgdir" install

    # Adjust pathes to arch 
    mv "$pkgdir"/lib "$pkgdir"/usr/
    mv "$pkgdir"/usr/local/bin "$pkgdir"/usr/
    rm -rf "$pkgdir"/usr/local
}

