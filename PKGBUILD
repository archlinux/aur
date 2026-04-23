# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zlob-git
_pkgname=zlob
pkgver=1.3.3.r0.g73cf013
pkgrel=1
pkgdesc='A fast SIMD-accelerated glob pattern matcher'
url='https://github.com/dmtrKovalenko/zlob'
arch=('x86_64')
license=('MIT')
makedepends=('zig')
provides=('zlob' 'libzlob.so')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$_pkgname"
    install -Dm755 zig-out/bin/zlob "$pkgdir/usr/bin/zlob"
    install -Dm644 zig-out/include/zlob.h ${pkgdir}/usr/include/zlob.h
    install -Dm644 zig-out/lib/libzlob.so ${pkgdir}/usr/lib/libzlob.so
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
