# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=ceaflate
pkgver=r4.fa5ec39
pkgrel=1
pkgdesc="MCC CEA map file compressor/decompressor"
depends=('zlib')
makedepends=('cmake' 'git')
arch=('i686' 'x86_64')
url="https://github.com/SnowyMouse/ceaflate"
license=('GPL')
source=('git+https://github.com/SnowyMouse/ceaflate.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/ceaflate
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"
    mkdir -p build
}

build() {
    cd "$srcdir"/build
    cmake ../ceaflate
    make
}

package() {
    cd "$srcdir"/build
    install -Dm775 ceaflate "$pkgdir/usr/bin/ceaflate"
}
