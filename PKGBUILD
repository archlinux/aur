# Maintainer: Prabhat Kumar <hi@prbhtkumr.xyz>
pkgname=gaur
pkgver=1.0.0
pkgrel=2
pkgdesc="A beautiful, interactive TUI for Arch Linux package management"
arch=('x86_64' 'aarch64')
url="https://github.com/prbhtkumr/gaur"
license=('GPL-3.0-only')
depends=('fzf' 'pacman-contrib')
makedepends=('go>=1.21')
optdepends=(
    'paru: AUR helper (recommended)'
    'yay: AUR helper (alternative)'
    'reflector: mirror list updates'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/prbhtkumr/gaur/archive/v$pkgver.tar.gz")
sha256sums=('d27f08b506565a3f6fefb96e57aa7960f54af38179d88ee725c3373c907838d5')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o gaur .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 gaur "$pkgdir/usr/bin/gaur"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
