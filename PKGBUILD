# Maintainer: Blaadick <null>

pkgname='blaadpapers'
pkgdesc='Super wallpaper manager'
pkgver='0.0.6'
pkgrel=1
arch=('any')
url='https://github.com/Blaadick/BlaadPapers'
license=('MIT')
depends=('qt6-base' 'hyprpaper')
makedepends=('cmake' 'ninja')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('419e10e5d74c39d6617683020d0cd21e93222f6866b4a23342fd5f2f0cccbb61')

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
