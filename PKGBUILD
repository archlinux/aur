# Maintainer: Patrick Desaulniers <desaulniers dot patrick at carrefour dot cegepvicto dot ca>

pkgname=wolf-shaper-git
pkgver=0.1.2.r3.g7dec897
pkgrel=1
pkgdesc="Waveshaper plugin w/ graph editor"
arch=('i686' 'x86_64')
url="https://github.com/pdesaulniers/wolf-shaper"
license=('GPL')
depends=()
makedepends=('jack' 'git' 'pkg-config' 'libx11' 'liblo' 'libgl' 'libxcursor')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/pdesaulniers/wolf-shaper")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

prepare() {
    cd "${pkgname%-*}"
    git submodule update --init --recursive
}

build() {
    cd "${pkgname%-*}"
    make BUILD_DSSI=true BUILD_LV2=true BUILD_VST2=true BUILD_JACK=true
}

package() {
    cd "${pkgname%-*}"
    make DESTDIR="$pkgdir/" PREFIX="/usr" VST_FOLDER_NAME=vst install
}
