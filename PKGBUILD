# Maintainer: Mohan Raman <mohan43u@gmail.com>

pkgname=machi
pkgver=0.5.0.r9.g401c9b6
pkgrel=1
pkgdesc='Window Manager for river wayland compositor'
arch=('x86_64')
url='https://codeberg.org/machi/machi'
license=('ISC')
depends=('libwayland-client.so' 'libwayland-server.so' 'libxkbcommon.so')
makedepends=('curl' 'wayland-protocols' 'wayland' 'libxkbcommon' 'zig' 'scdoc')
options=(zipman)
source=("git+https://codeberg.org/$pkgname/$pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    zig build -Doptimize=ReleaseSafe --prefix "$startdir/zig-out/usr"
}

package() {
    cp -a "$startdir/zig-out"/* "$pkgdir/"
}
