# Maintainer: Blaadick <null>

_reponame="AurSynchronization"
pkgname="blaadpapers"
pkgdesc="Allows you to easily automate package updates on AUR"
pkgver="1.0.0"
pkgrel=1
arch=("any")
url="https://github.com/Blaadworks/AurSynchronization"
license=("MIT")
depends=("qt6-base" "hyprpaper")
makedepends=("cmake" "ninja" "librsvg")
options=("!debug")
source=("blaadpapers-1.0.0.tar.gz::https://github.com/Blaadworks/AurSynchronization/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=("3bdfd6121883ac77f6dd0a3df388d6ed0e5da74b45dedc66c050c5ee0436f79a")

build() {
    cd "BlaadPapers-$pkgver"
    cmake -B build -G Ninja -Wno-dev
    cmake --build build
}

package() {
    cd "BlaadPapers-$pkgver"

    install -Dm755 "./build/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "./res/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "./res/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "./res/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    for size in 16 22 24 32 36 48 64 72 96 128 192 256 384 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        rsvg-convert -w $size -h $size -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png" "./res/$pkgname.svg"
    done
}
