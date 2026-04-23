# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hys-git
_pkgname="${pkgname%-git}"
pkgver=0.2.0.r0.gded969a
pkgrel=1
pkgdesc='Terminal RSS Reader for Digital Minimalists in Zig. — Build from the main branch'
url='https://github.com/superstarryeyes/hys'
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
makedepends=('zig')
provides=('hys')
conflicts=('hys')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$_pkgname"
    install -Dm755 zig-out/bin/hys "$pkgdir/usr/bin/hys"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
