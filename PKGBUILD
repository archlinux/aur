# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=freeaoe-git
pkgver=1437.7e7405f
pkgrel=1
pkgdesc='A free engine capable of running Age of Kings.'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/freeaoe'
license=('GPL3')
depends=("genieutils-git>=709" 'sfml')
makedepends=('git' 'miniaudio-git>=2049')
conflicts=(freeaoe)
provides=(freeaoe)
optdepends=('ageofconquerors-trial-data: Game data files')
source=('git+https://github.com/sandsmark/freeaoe.git')
md5sums=('SKIP')

pkgver() {
    cd freeaoe
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../freeaoe \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDEFAULT_DATA_PATH=/usr/share/ageofconquerors-trial/ \

    make
}


package() {
    cd build
    make DESTDIR="$pkgdir" install
}
