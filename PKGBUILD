# Maintainer: czyt <czytcn@gmail.com>
pkgname=owl-dictionary-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Owl: a web dictionary app supporting MDX/MDD dictionary files"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/owl"
license=('LicenseRef-Proprietary')
depends=('gtk4')
optdepends=('webkitgtk-6.0: built-in web view for the dictionary reader')
provides=('owl-dictionary')
conflicts=('owl-dictionary')
options=('!strip' '!debug')

source_x86_64=("owl-dictionary-${pkgver}-linux-x64.deb::https://github.com/ca-x/owl/releases/download/v${pkgver}/owl-dictionary-${pkgver}-linux-x64.deb")
source_aarch64=("owl-dictionary-${pkgver}-linux-arm64.deb::https://github.com/ca-x/owl/releases/download/v${pkgver}/owl-dictionary-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('fa09f7c2f4997f0772bde1fc1ab16342528e04d3206d6406c8dad3fc88c2d18e')
sha256sums_aarch64=('77f561b14ff5cabba093ebdc8a9f81e8f82f48986b83f54785241dcaa1f1c4f4')
noextract=(
    "owl-dictionary-${pkgver}-linux-x64.deb"
    "owl-dictionary-${pkgver}-linux-arm64.deb"
)

package() {
    local _suffix
    case "$CARCH" in
        x86_64)  _suffix=x64 ;;
        aarch64) _suffix=arm64 ;;
    esac

    # The bundle layout is kept as upstream ships it: the desktop app lives in
    # /opt/owl-dictionary and /usr/bin/owl-dictionary is a symlink to it.
    bsdtar -xOf "${srcdir}/owl-dictionary-${pkgver}-linux-${_suffix}.deb" 'data.tar.*' |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"
}
