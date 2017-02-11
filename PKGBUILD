# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='cen64'
pkgver=0.3
pkgrel=1
pkgdesc='Cycle-accurate Nintendo 64 emulator'
arch=(
    'i686'
    'x86_64'
)
url='http://www.cen64.com/'
license=(
    'BSD'
)
depends=(
    'mesa'
    'openal'
)
makedepends=(
    'cmake'
    'git'
)
provides=(
    'cen64'
)
conflicts=(
    'cen64-git'
)
source=(
    'git+https://github.com/tj90241/cen64.git'
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}/${pkgname}" || exit 1
    
    git describe --tags | sed 's/v//'
}

prepare() {
    cd "${srcdir}/${pkgname}" || exit 1
    
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}/build" || exit 1

    cmake ..
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"

    install -Dm755  \
        "cen64" "${pkgdir}/usr/bin/cen64"
    install -Dm644  \
        "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
