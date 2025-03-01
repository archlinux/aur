# Maintainer: viable <hi@viable.gg>
pkgname=lifetch-git
pkgver=0.1.1.r23.gffcbaad
pkgrel=1
pkgdesc="Fast system information fetcher written in zig"
arch=('x86_64' 'aarch64')
url="https://github.com/nuiipointerexception/lifetch"
license=('MIT')
depends=('glibc')
makedepends=('zig' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 --match="v*" HEAD 2>/dev/null || \
    echo "0.1.1.r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
}

build() {
    cd "$pkgname"
    zig build \
        --summary all \
        -Doptimize=ReleaseFast \
        -Dcpu=native
}

package() {
    cd "$pkgname"
    install -Dm755 zig-out/bin/lifetch "$pkgdir/usr/bin/lifetch"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
