# Maintainer: Luuk Blankenstijn <luukblankenstijn@gmail.com>
pkgname=hyprpop
pkgver=0.2.0
pkgrel=1
pkgdesc="Toggle floating windows in Hyprland with keybindings"
arch=('x86_64')
url="https://github.com/LuukBlankenstijn/hyprpop"
license=('MIT')
depends=('hyprland' 'chromium')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LuukBlankenstijn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4439ccb3df8e01d242eb9f874ef43b8f915e4bcf0ecc5050f9043928861dc4d2')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o $pkgname
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
