# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
pkgname=stl-next-git
pkgver=c62bb62
pkgrel=1
pkgdesc="A high-performance Steam game wrapper replacement for SteamTinkerLaunch"
arch=('x86_64')
url="https://github.com/Distracted-E421/stl-next"
license=('MIT')
depends=('glibc')
makedepends=('git' 'zig')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/Distracted-E421/stl-next.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --always --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$pkgname"
    zig build --release -Doptimize=ReleaseFast
}

package() {
    install -Dm755 "$srcdir/$pkgname/zig-out/bin/stl-next" "$pkgdir/usr/bin/stl-next"
}
