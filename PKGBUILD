# Maintainer: Patrick Desaulniers <patrick dot desaulniers36 at gmail dot com>

pkgname=wolf-shaper-git
pkgver=0.1.8.r62.g6b1ac64
pkgrel=1
pkgdesc="Waveshaper plugin w/ graph editor"
arch=('i686' 'x86_64')
url="https://github.com/wolf-plugins/wolf-shaper"
license=('GPL')
depends=('libglvnd' 'libx11')
makedepends=('dssi' 'lv2' 'jack')
optdepends=('jack: for standalone application')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/wolf-plugins/wolf-shaper")
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
    make DESTDIR="$pkgdir" PREFIX="/usr" VST_FOLDER_NAME=vst install
}
