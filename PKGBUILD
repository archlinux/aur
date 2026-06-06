# Maintainer: Nex <nexvlif@gmail.com>

pkgname=nuripaper
pkgver=1.0.0
pkgrel=1
pkgdesc="A straightforward wallpaper tool for dynamic and static backgrounds"
arch=('x86_64')
options=('!debug')
url="https://github.com/nexvlif/nuripaper"
license=('MIT')
depends=(
    'vulkan-icd-loader'
    'spdlog'
    'wayland'
    'ffmpeg'
    'wlr-protocols'
)
makedepends=(
    'cmake'
    'ninja'
    'shaderc'
    'vulkan-headers'
    'wayland-protocols'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    curl -Lo third_party/stb_image.h \
        "https://raw.githubusercontent.com/nothings/stb/master/stb_image.h"
}

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/nuripaper "$pkgdir/usr/bin/nuripaper"
}
