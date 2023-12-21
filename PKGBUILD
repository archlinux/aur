# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>

pkgname=ppm2pwg-git
pkgver=r225.32960d3
pkgrel=1
pkgdesc="Misc printing format conversion utilities: ppm2pwg, pwg2ppm, pdf2printable, baselinify, ippposter"
arch=("x86_64")
url="https://github.com/attah/ppm2pwg"
license=('GPL-3.0')
source=("git+https://github.com/attah/ppm2pwg.git")
sha512sums=('SKIP')
makedepends=('git')

prepare() {
    cd "${srcdir}/ppm2pwg"
    pwd
    git submodule update --init --recursive
}

pkgver() {
    cd "ppm2pwg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/ppm2pwg"
    make
}

package() {
    cd "${srcdir}/ppm2pwg"

    utils=(
        ppm2pwg
        pwg2ppm
        pdf2printable
        baselinify
        ippposter
    )

    for util in "${utils[@]}"; do
        install -D -m755 "$util" "${pkgdir}/usr/bin/$util"
    done
}
