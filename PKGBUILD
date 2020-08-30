# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=genieutils-git
pkgver=10.r654.2fbb27d
pkgrel=1
_apiver=10
_pcrioapi=2
pkgdesc='A library to read/write certain data and resource files of genie engine games'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/genieutils'
license=('LGPL3')
depends=("pcrio-git>=${_pcrioapi}" 'boost-libs')
makedepends=('git' 'zstr-git')
conflicts=(genieutils)
provides=(genieutils)
source=('git+https://github.com/sandsmark/genieutils.git')
md5sums=('SKIP')

pkgver() {
    cd genieutils
    printf "${_apiver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../genieutils \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGUTILS_TOOLS=True

    make
}


package() {
    cd build
    make DESTDIR="$pkgdir" install
}
