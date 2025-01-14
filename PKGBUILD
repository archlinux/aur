# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
__pkgname="${_pkgname}fmt"
pkgname="$__pkgname-git"
pkgver=rc6149fe
pkgrel=1
pkgdesc='The Jule Programming Language Code Formatter'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/${_pkgname}lang/$__pkgname"
license=('BSD-3-Clause')
groups=('jule')
source=("git+$url.git")
sha256sums=('SKIP')
depends=('gcc-libs')
makedepends=('julec' 'git')
provides=("$__pkgname")
conflicts=("$__pkgname")

pkgver() {
    cd "$__pkgname"
    echo "r$(git rev-parse --short HEAD)"
}

build() {
    cd "$__pkgname"
    mkdir -p bin
    echo "Building $__pkgname for $CARCH..."
    julec --opt-deadcode -o "bin/$__pkgname" ./src
}

check() {
    cd "$__pkgname"
    julec test ./src
}

package() {
    cd "$__pkgname"
    install -Dm0755 "bin/$__pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
