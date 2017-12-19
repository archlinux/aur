# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=bloaty-git
pkgver=0.0.0.r232.g340c0a7
pkgrel=1
pkgdesc="A size profiler for binaries"
arch=("x86_64" "x86")
url="https://github.com/google/bloaty"
license=("Apache")
depends=('gcc-libs')
makedepends=('git' 'cmake')
source=("git+https://github.com/google/bloaty")
md5sums=("SKIP")

pkgver() {
    cd bloaty
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    rm -rf "${srcdir}/build"
    mkdir "${srcdir}/build"
    cd "${srcdir}/build"
    cmake -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${srcdir}/bloaty"
    make
}

package() {
    cd "${srcdir}/build"
    install -Dm755 "${srcdir}/build/bloaty" \
        "${pkgdir}/usr/bin/bloaty"
    install -Dm644 "${srcdir}/bloaty/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
