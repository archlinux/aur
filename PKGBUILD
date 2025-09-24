pkgname=rustmius
pkgver=1.3.3
pkgrel=1
pkgdesc="Full local Termius alternative for Linux"
arch=('x86_64')
url="https://github.com/Cleboost/Rustmius"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    mv "Rustmius-$pkgver" "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    pnpm i
}

build() {
  cd "$pkgname-$pkgver"
  pnpm tauri build --no-bundle
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 src-tauri/target/release/rustmius "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 $pkgname.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
