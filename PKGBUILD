# Maintainer: Fermín Olaiz <fermin@olaiz.net>

pkgname=substation
pkgver=0.2.2
pkgrel=1
pkgdesc="An OpenStack Terminal User Interface with modern experiences"
arch=('x86_64')
url="https://github.com/cloudnull/$pkgname"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'ncurses' 'curl')
makedepends=('git' 'swift-language')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudnull/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ca277697448ddefdac7d3820cc824ade54d849b8a865ec3c81fbe43847d4ca74')

prepare() {
	cd "$pkgname-$pkgver"
	swift package resolve
}

build() {
	cd "$pkgname-$pkgver"
	swift build -c release --static-swift-stdlib -v
}

check() {
	cd "$pkgname-$pkgver"
	# Currently broken
	# swift test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" ".build/$CARCH-unknown-linux-gnu/release/substation"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
