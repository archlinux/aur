# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=irstlm-git
pkgver=r108.5ded9e3
pkgrel=1
pkgdesc='IRSTLM Toolkit'
arch=('x86_64' 'i686')
url='https://github.com/irstlm-team/irstlm'
license=('LGPL')
depends=('bash' 'perl' 'zlib')
makedepends=('git')
conflicts=(irstlm)
provides=(irstlm)
source=('git+https://github.com/sandsmark/irstlm.git')
md5sums=('SKIP')

pkgver() {
    cd irstlm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../irstlm \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \

    make VERBOSE=1
}


package() {
    cd build
    make DESTDIR="$pkgdir" install
}
