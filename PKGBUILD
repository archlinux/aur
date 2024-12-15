# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
__pkgname="${_pkgname}fmt"
pkgname="$__pkgname-git"
pkgver=1.r0.gb3acc0e
pkgrel=1
pkgdesc='The Jule Programming Language Code Formatter'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/${_pkgname}lang/$__pkgname"
license=('BSD-3-Clause')
source=("git+$url.git")
sha256sums=('SKIP')
depends=('julec-git')
provides=("$__pkgname")
conflicts=("$__pkgname")

pkgver() {
    cd "$__pkgname"
    echo "1.r$(git describe --all --long | sed 's/-/./g' | cut -d '.' -f 2-)"
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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$__pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$__pkgname"
}
