# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=genieutils-git
pkgver=4.r439.d9b2ce7
pkgrel=1
_abiver=4
pkgdesc='A library to read/write certain data and resource files of genie engine games'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/genieutils'
license=('LGPL3')
depends=('zstr-git' 'pcrio-git')
makedepends=('git')
conflicts=(genieutils)
provides=(genieutils)
source=('git+https://github.com/sandsmark/genieutils.git')
md5sums=('SKIP')

pkgver() {
    cd genieutils
    printf "${_abiver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../genieutils \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \

    make
}


package() {
    cd build
    make DESTDIR="$pkgdir" install
}
