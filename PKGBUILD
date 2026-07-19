# Maintainer: Voten kevinfl780@proton.me

pkgname=netmuxd-git
_pkgname=netmuxd
pkgver=0.4.3.r7.g68d5bc9
pkgrel=1
pkgdesc="An alternative to usbmuxd just for networking (latest Git version)"
arch=('x86_64')
url="https://github.com/jkcoxson/netmuxd"
license=('LGPL-2.1-only')

depends=()
makedepends=('cargo' 'git')

provides=('netmuxd')
conflicts=('netmuxd' 'netmuxd-bin')

options=('!lto')

source=("$_pkgname::git+https://github.com/jkcoxson/netmuxd.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    cargo build --release --locked
}

package() {
    cd "$_pkgname"
    install -Dm755 target/release/netmuxd \
        "$pkgdir/usr/bin/netmuxd"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
