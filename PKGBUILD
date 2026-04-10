pkgname=ebyt
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal X11 activity tracker"
arch=('x86_64')
url='https://github.com/barjo/ebyt'
license=('Apache-2.0')
depends=('libx11' 'libxi' 'sqlite')
makedepends=('zig>=0.15.0')
provides=('ebyt')
conflicts=('ebyt-bin')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/barjo/ebyt/archive/v$pkgver.tar.gz")
sha256sums=('4c55846bb62277f8b4e710d399d76464d5b09289f2b78ea8ae7b700d583b6193')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 zig-out/bin/ebyt "$pkgdir/usr/bin/ebyt"
    install -Dm644 ebyt.service "$pkgdir/usr/lib/systemd/user/ebyt.service"
}
