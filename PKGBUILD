# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper-sway-git"
pkgver=r0.0000000
pkgrel=1
pkgdesc="Sway portal for wallpiper"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('wallpiper-git' 'wayland')
provides=('wallpiper-sway')
conflicts=('wallpiper-sway')
makedepends=('git' 'wayland' 'wayland-protocols')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make build-sway
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 target/release/wallpiper-portal-sway "$pkgdir/usr/lib/wallpiper/wallpiper-portal-sway"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
