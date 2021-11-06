# Maintainer: Patrick Desaulniers <desaulniers dot patrick at carrefour dot cegepvicto dot ca>

pkgname=wolf-spectrum-git
pkgver=1.0.0.r49.gb48f9c5
pkgrel=1
pkgdesc="Spectrogram plugin"
arch=('i686' 'x86_64')
url="https://github.com/wolf-plugins/wolf-spectrum"
license=('GPL')
depends=()
makedepends=('jack' 'git' 'pkg-config' 'libx11' 'liblo' 'libgl')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/wolf-plugins/wolf-spectrum")
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
    make BUILD_LV2=true BUILD_VST2=true BUILD_JACK=true
}

package() {
    cd "${pkgname%-*}"
    make DESTDIR="$pkgdir/" PREFIX="/usr" VST_FOLDER_NAME=vst install
}
