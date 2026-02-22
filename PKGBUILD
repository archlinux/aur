# Maintainer: cxinu <cxinu.main@protonmail.com>
pkgname=boomer-wayland-git
_pkgname=boomer
pkgver=r294.93d553b
pkgrel=1
pkgdesc="A zooming tool for Linux - Native Wayland version"
arch=('x86_64' 'aarch64')
url="https://github.com/cxinu/zoomer"
license=('MIT')

depends=('wayland' 'mesa' 'grim')
makedepends=('git' 'nim' 'nimble' 'wayland-protocols')

provides=('boomer')
conflicts=('boomer')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    nimble build -d:release -d:wayland -y
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 boomer "$pkgdir/usr/bin/boomer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
