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
license=('BSD')
depends=(
    'mesa'
    'openal'
)
makedepends=(
    'cmake'
    'git'
)
provides=('cen64')
conflicts=('cen64-git')
source=('git+https://github.com/tj90241/cen64.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    
    git tag | tail -n 1 | sed 's/v//'
}

prepare() {
    cd "${pkgname}"

    git checkout "$(git tag | tail -n 1)" --quiet
    
    mkdir -p build
}

build() {
    cd "${pkgname}/build"

    cmake ..
    make
}

package() {
    cd "${pkgname}/build"

    install -Dm755  \
        "cen64" "${pkgdir}/usr/bin/cen64"
    install -Dm644  \
        "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
