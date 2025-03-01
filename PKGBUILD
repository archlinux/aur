# Maintainer: viable <hi@viable.gg>
pkgname=lifetch-git
pkgver=0.1.1.r0.g1234567
pkgrel=3
pkgdesc="Fast system information fetcher written in zig"
arch=('x86_64' 'aarch64')
url="https://github.com/nuiipointerexception/lifetch"
license=('MIT')
depends=('glibc')
options=('!debug')
makedepends=('zig' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd lifetch
    git describe --long --tags --abbrev=7 --match="v*" HEAD 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    echo "0.1.1.r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd lifetch
}

build() {
    cd lifetch
    zig build \
        --summary all \
        -Doptimize=ReleaseFast \
        -Dcpu=native
}

package() {
    cd lifetch
    install -Dm755 zig-out/bin/lifetch "lifetch/usr/bin/lifetch"
    install -Dm644 README.md "lifetch/usr/share/doc/lifetch/README.md"
    install -Dm644 LICENSE "lifetch/usr/share/licenses/lifetch/LICENSE"
} 
