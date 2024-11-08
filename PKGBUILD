# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=neohtop
pkgver=1.0.8
pkgrel=1
pkgdesc="💪🏻 htop on steroids"
arch=('x86_64')
url="https://github.com/Abdenasser/neohtop"
license=('MIT')
makedepends=('rust' 'npm' 'nodejs>=16')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "neohtop.desktop" "$url/raw/main/app-icon.png")
sha256sums=('f47e5947b32bd94025185a7215472931096498c0603c2f97d0d381b4761d6fc8'
            '268edb20d231395da8f724283cd4244facd15ef9564b6705e0324223116eccbc'
            'da490123ad87ff26b96b189eb4ed1b815e5e39ce3bec3b939fcdf331525dcefa')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm run tauri build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "src-tauri/target/release/neo-htop" "$pkgdir/usr/bin/neohtop"
    install -Dm644 "$srcdir/neohtop.desktop" "$pkgdir/usr/share/applications/neohtop.desktop"
    install -Dm644 "$srcdir/app-icon.png" "$pkgdir/usr/share/pixmaps/neohtop.png"
}
