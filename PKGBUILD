# Maintainer: HowardsPlayPen <me at aitchpea dot com>
pkgname=pipewire-waybar
pkgver=1.0.1
pkgrel=1
pkgdesc="PipeWire sink switcher for Waybar: daemon, CLI and GTK4 layer-shell picker"
arch=('x86_64' 'aarch64')
url="https://github.com/HowardsPlayPen/pipewire-waybar"
license=('MIT')
depends=('pipewire' 'sdbus-cpp' 'gtk4' 'gtk4-layer-shell' 'glib2' 'glibc' 'gcc-libs')
makedepends=('cmake' 'nlohmann-json' 'pkgconf')
optdepends=('waybar: bar widget host')
install=pipewire-waybar.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a34cb8bf2ee8b0c11241e28a60795f20cfd4d8e23e4bb58bc3060d8a578caa0a')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    cd "$pkgname-$pkgver"
    install -Dm644 data/style.css -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 contrib/waybar-config-snippet.jsonc -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
