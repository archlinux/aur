# Maintainer: Luuk Blankenstijn <luukblankenstijn@gmail.com>
pkgname=hyprpop
pkgver=0.2.1
pkgrel=1
pkgdesc="Toggle floating windows in Hyprland with keybindings"
arch=('x86_64')
url="https://github.com/LuukBlankenstijn/hyprpop"
license=('MIT')
depends=('hyprland' 'chromium')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LuukBlankenstijn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cc7fc0f157b8093626cb25d9dc17757e13c4fbebe4ce668a4bd35debc3c96952')

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
