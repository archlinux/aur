# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
# Upstream: Asd-g — https://github.com/Asd-g/AviSynthPlus-RIFE
# Source recipe. Optional sibling: avisynth-plugin-rife-asdg-bin.
# Git source: the GitHub tag tarball does not include ncnn / avs_c_api_loader.

pkgname=avisynth-plugin-rife-asdg
pkgver=1.4.1
pkgrel=1
pkgdesc="AviSynth+ RIFE frame interpolation (Asd-g, ncnn Vulkan)"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynthPlus-RIFE'
license=('MIT')
depends=('avisynthplus' 'vulkan-icd-loader' 'gcc-libs' 'glibc')
makedepends=('cmake' 'ninja' 'git' 'vulkan-headers' 'vulkan-icd-loader' 'glslang')
conflicts=('avisynth-plugin-rife-asdg-bin')
source=("git+https://github.com/Asd-g/AviSynthPlus-RIFE.git#tag=${pkgver}")
sha256sums=('f1502cf078cf09e5f7f2566d3f466928a7de2088e36cb45698ffe9f20959989b')

prepare() {
    cd AviSynthPlus-RIFE
    git submodule update --init --recursive
}

build() {
    cmake -S AviSynthPlus-RIFE -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
