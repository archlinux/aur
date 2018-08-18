# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=freeaoe-git
pkgver=r399.331551a
pkgrel=1
pkgdesc='A free engine capable of running Age of Kings.'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/freeaoe'
license=('GPL3')
depends=('genieutils' 'sfml')
makedepends=('git')
conflicts=(freeaoe)
provides=(freeaoe)
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

    make
}


package() {
    cd build
    make DESTDIR="$pkgdir" install
}
