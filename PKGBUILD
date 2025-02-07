# Maintainer: yubimusubi
# Maintainer: taotieren <admin@taotieren.com>

pkgbase=bin2c
pkgname=('bin2c')
pkgver=0.15.0
pkgrel=1
pkgdesc="bin2c Conversion Tool."
arch=($CARCH)
url="https://github.com/AraHaan/bin2c"
license=('MIT')
provides=(
    ${pkgname}
)
conflicts=(
    ${pkgname}
)
replaces=()
depends=(
    glibc
    gcc-libs
    hicolor-icon-theme
)
makedepends=('gcc')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cbee93038219e6ef80341af411b578211d362362115da55bc82eed128115c64b')

build() {
    cd "${pkgbase}-${pkgver}"
    g++ -std=c++17 bin2c.cpp -lstdc++fs -o bin2c
}

# check() {
#     cd "${pkgbase}-${pkgver}"
#     rm -f ./tests/VP.hpp
#     ./bin2c /custvar "IMAGE_VP" /nohead /infile "./tests/VP.jpg" /outfile "./tests/VP.hpp"
#     g++ -O3 -std=c++14 ./tests/VP.cpp -o ./tests/VP
#     ./tests/VP
# }

package() {
    cd "${pkgbase}-${pkgver}"

    install -Dm0755 bin2c -t $pkgdir/usr/bin
    # icon
    local _icon
    for _icon in 16 24 32; do
        install -Dm0644 icons/linux/bin2c-icon-${_icon}x${_icon}.png \
            ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}-icon.png
    done
    # desktop entry
    install -Dm0644 icons/linux/bin2c.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

    install -Dm0644 LICENSE -t ${pkgdir}/usr/share/licenses/bin2c/
}
