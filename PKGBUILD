# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=motrix-next-bin
pkgver=3.9.8
pkgrel=1
pkgdesc="A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust"
arch=(x86_64 aarch64)
url="https://github.com/AnInsomniacy/motrix-next"
license=(MIT)
depends=(
    cairo
    gdk-pixbuf2
    gtk3
    hicolor-icon-theme
    libappindicator
    libsoup3
    webkit2gtk-4.1
)
source=("LICENSE-MIT")
sha256sums=('82e71190970399412c9e40fc3f4e2dc1cb070d56433ee7f25af7a4e67f401f0e')
sha256sums_x86_64=('e7e8f5dea95b870894420edfa3b65aa38abeed27703e0dea4297294e2aa8f860')
sha256sums_aarch64=('aae0b34c8638ff6cfb302914b175cb1c5bc5b01542e7bb9c996f2c114242dffc')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/MotrixNext_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/MotrixNext_${pkgver}_arm64.deb")

package() {
    # Extract the contents of data.tar.gz into the pkgdir itself
    tar -xf data.tar.gz -C "$pkgdir"

    # Fix empty Categories so KDE launcher displays the app
    sed -i '/^Categories=/c\Categories=Network;FileTransfer;' \
        "$pkgdir/usr/share/applications/MotrixNext.desktop"

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
