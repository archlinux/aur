# Maintainer: Lenar Imamutdinov <lenar dot imamutdinov at gmail dot com>
_pkgname=h2status
pkgname=${_pkgname}-git
pkgver=0.1.0.r1.g1af7a06
pkgrel=1
pkgdesc="Lightweight status bar for sway/i3"
arch=('x86_64')
url="https://github.com/neoden/h2status"
license=('MIT')
depends=()
makedepends=('git' 'go')
optdepends=('bluez: bluetooth support')
source=("git+https://github.com/neoden/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    export CGO_ENABLED=0
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"
    go build -o "$_pkgname" .
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 config.example.toml "$pkgdir/usr/share/$_pkgname/config.example.toml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
