pkgname=rustmius-git
_pkgname=rustmius
pkgver=r147.3691240
pkgrel=1
pkgdesc="Full local Termius alternative for Linux (GTK4) - latest development version (git)"
arch=('x86_64')
url="https://github.com/Cleboost/Rustmius"
license=('AGPL-3.0-or-later')
depends=('gtk4' 'vte4')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cargo build --release --locked
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "packages/org.rustmius.Rustmius.desktop" "$pkgdir/usr/share/applications/org.rustmius.Rustmius.desktop"
    install -Dm644 "packages/rustmius.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
