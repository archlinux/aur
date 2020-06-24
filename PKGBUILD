# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=advancedgenieeditor-git
pkgver=r753.58ecae1
pkgrel=1
_abiver=9
pkgdesc='A program for editing data of genie files.'
arch=('x86_64' 'i686')
url='http://aok.heavengames.com/blacksmith/showfile.php?fileid=11002'
license=('GPL3')
depends=("genieutils-git>=${_abiver}" 'sfml' 'wxgtk2')
makedepends=('git')
conflicts=(advancedgenieeditor)
provides=(advancedgenieeditor)
source=('git+https://github.com/sandsmark/AGE.git')
md5sums=('SKIP')

pkgver() {
    cd AGE
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../AGE \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \

    make
}


package() {
    cd build
    make DESTDIR="$pkgdir" install
}
