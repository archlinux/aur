# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nex <nexvlif@gmail.com>

pkgname=nuripaper
pkgver=2.0.0
pkgrel=1
pkgdesc="A straightforward wallpaper tool for dynamic and static backgrounds"
arch=(x86_64)
url="https://github.com/nexvlif/nuripaper"
license=(MIT)
depends=(
    vulkan-icd-loader
    spdlog
    wayland
    ffmpeg
    wlr-protocols
    tomlplusplus
)
makedepends=(
    cmake
    ninja
    shaderc
    vulkan-headers
    wayland-protocols
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f2f8014f2264ea46d6a4f95a21cc0f2fb76b6d06d16f95071f249b366948445b')

build() {
    cmake \
        -B build \
        -S "$pkgname-$pkgver" \
        -G Ninja \
        -W no-dev \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$srcdir/build/nuripaper" "$srcdir/build/nuripaper-ctl" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
