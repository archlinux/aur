pkgname=rustmius
pkgver=2.4.2
pkgrel=1
pkgdesc="Full local Termius alternative for Linux (GTK4) - built from stable source"
arch=('x86_64')
url="https://github.com/Cleboost/Rustmius"
license=('AGPL-3.0-or-later')
depends=('gtk4' 'vte4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('34f3e15b8b7437d7553a617fe4cf69ad086dce6df640bff12de2da3d93c2b54d')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "packages/org.rustmius.Rustmius.desktop" "$pkgdir/usr/share/applications/org.rustmius.Rustmius.desktop"
    install -Dm644 "packages/rustmius.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
