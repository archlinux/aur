pkgname=rustmius
_srcname=Rustmius
pkgver=2.5.0
pkgrel=1
pkgdesc="Full local Termius alternative for Linux (GTK4) - built from stable source"
arch=('x86_64')
url="https://github.com/Cleboost/Rustmius"
license=('AGPL-3.0-or-later')
depends=('gtk4' 'vte4')
makedepends=('cargo')
source=("$_srcname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('15c4cd66db4d6d3752866b35a9499d209b99daa4151d239464d866dc77381468')

build() {
    cd "$_srcname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$_srcname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "packages/org.rustmius.Rustmius.desktop" "$pkgdir/usr/share/applications/org.rustmius.Rustmius.desktop"
    install -Dm644 "packages/rustmius.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
