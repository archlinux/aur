# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=pcrio-git
pkgver=46.8839373
pkgrel=1
pkgdesc='C library for editing resource strings in pe/coff files.'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/pcrio'
license=('BSD')
depends=('glibc')
makedepends=('git')
conflicts=(pcrio)
provides=(pcrio)
source=('git+https://github.com/sandsmark/pcrio.git')
md5sums=('SKIP')

pkgver() {
    cd pcrio
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../pcrio \
        -DCMAKE_BUILD_TYPE=RelDebug \
        -DCMAKE_INSTALL_PREFIX=/usr \

    make
}


package() {
    install -Dm644 pcrio/COPYING ${pkgdir}/usr/share/licenses/pcrio-git/COPYING
    cd build
    make DESTDIR="$pkgdir" install
}
