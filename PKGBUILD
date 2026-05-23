# Maintainer: Mohan Raman <mohan43u@gmail.com>
# url: https://codeberg.org/mohan43u/machi/src/branch/pkgbuild/PKGBUILD

pkgname=machi
pkgver=v0.5.0
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

prepare() {
    cd $pkgname
    curl -sfLS 'https://codeberg.org/machi/machi/pulls/29.patch' | git apply -
}

build() {
    cd $pkgname
    zig build -Doptimize=ReleaseSafe --prefix "$startdir/zig-out/usr"
}

package() {
    cp -a "$startdir/zig-out"/* "$pkgdir/"
}
