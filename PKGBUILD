# Maintainer: Florian Thienel/DL3NEY <ftl@thecodingflow.com>
pkgname="hellocontest"
pkgver="1.0.0"
pkgrel=1
pkgdesc="A simple HF contest logger for Linux."
arch=('x86_64' 'i686')
url="https://github.com/ftl/hellocontest"
license=('MIT')
depends=('gtk3' 'cairo' 'pango')
makedepends=('git' 'make' 'go')
provides=("${pkgname}")
source=("hellocontest-$pkgver.tar.gz::https://github.com/ftl/hellocontest/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecdcfbae316c878a9c63d3ac93083d486760132b249009d8110553491d122e54')

build() {
    cd "$pkgname-$pkgver"
    make VERSION_NUMBER="$pkgver" build
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Upgrade:
# - update pkgver
# - makepkg -g
# - update sha256sums
# - makepkg --printsrcinfo > .SRCINFO
# - makepkg -i
