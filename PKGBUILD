# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=frei0r-plugins-git
pkgver=2.2.0.r1.g599b478
pkgrel=1
pkgdesc='A minimalistic plugin API for video effects (git version)'
arch=('x86_64')
url='https://www.dyne.org/software/frei0r/'
license=('GPL')
depends=('cairo' 'gavl')
makedepends=('git' 'cmake' 'opencv' 'doxygen')
optdepends=('opencv: for facebl0r and facedetect plugins')
provides=('frei0r-plugins')
conflicts=('frei0r-plugins')
source=('git+https://github.com/dyne/frei0r.git')
sha256sums=('SKIP')

pkgver() {
    git -C frei0r describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S frei0r \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
