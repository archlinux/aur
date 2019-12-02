# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=freeaoe-git
pkgver=r869.18e5b66
pkgrel=1
_abiver=5
pkgdesc='A free engine capable of running Age of Kings.'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/freeaoe'
license=('GPL3')
depends=("genieutils-git>=${_abiver}" 'sfml' 'mini_al-git')
makedepends=('git')
conflicts=(freeaoe)
provides=(freeaoe)
optdepends=('ageofconquerors-trial-data: Game data files')
source=('git+https://github.com/sandsmark/freeaoe.git')
md5sums=('SKIP')

pkgver() {
    cd freeaoe
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
