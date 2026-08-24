# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper-cosmic-git"
pkgver=r0.0000000
pkgrel=1
pkgdesc="COSMIC portal for wallpiper"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('wallpiper-git' 'wayland')
provides=('wallpiper-cosmic')
conflicts=('wallpiper-cosmic')
makedepends=('git' 'wayland' 'wayland-protocols')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make build-cosmic
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 target/release/wallpiper-portal-cosmic "$pkgdir/usr/lib/wallpiper/wallpiper-portal-cosmic"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
