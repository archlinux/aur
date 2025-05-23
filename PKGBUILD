# Maintainer: Blaadick <null>

pkgname='blaadpapers'
pkgdesc='Super wallpaper manager'
pkgver=0.0.7
pkgrel=1
arch=('any')
url='https://github.com/Blaadick/BlaadPapers'
license=('MIT')
depends=('qt6-base' 'hyprpaper')
makedepends=('cmake' 'ninja' 'librsvg')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66bc58f2c0e5ddca8edb9e713ac4ea1f6e543ac40bfce1ac56b982cd2d32c412')

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
