# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=dmsdos-git
pkgver=56.1476832
pkgrel=1
pkgdesc='Linux utilities to handle dos/win95 doublespace/drivespace/stacker'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/dmsdos'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'cmake')
conflicts=(dmsdos)
provides=(dmsdos)
source=('git+https://github.com/sandsmark/dmsdos.git')
md5sums=('SKIP')

pkgver() {
    cd dmsdos
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../dmsdos \
        -DCMAKE_INSTALL_PREFIX=/usr \

    make
}


package() {
    cd build
    make DESTDIR="$pkgdir" install
}
