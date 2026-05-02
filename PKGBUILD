# Maintainer: Florian Thienel/DL3NEY <ftl@thecodingflow.com>
pkgname="hellocontest"
pkgver="1.2.0"
pkgrel=1
pkgdesc="A simple HF contest logger for Linux."
arch=('x86_64' 'i686')
url="https://github.com/ftl/hellocontest"
license=('MIT')
depends=('qt6-base')
makedepends=('git' 'make' 'go')
provides=("${pkgname}")
source=("hellocontest-$pkgver.tar.gz::https://github.com/ftl/hellocontest/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32d029b14f6d886d297e32dfcedf8b913f0847b4eac513573f18406b03be55e3')

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
