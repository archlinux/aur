# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

pkgname="mission2teegarden-b"
pkgver="0.1.1"
pkgrel=1
pkgdesc='a journey to the unexplored planet Teegarden b'
url='https://github.com/LuckyTurtleDev/mission2teegarden-b'
license=('AGPL')

depends=('gcc-libs'
         'alsa-lib'
         'gtk3'
         'libusb')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/LuckyTurtleDev/mission2teegarden-b/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4f73c8c9343b5f8ff340ddb7aab723884e7f4dbf8b8d8ca637895ef36b0ec4b5b0cb298ab4acad8f78b5b0c5431fb61b39ebab06e6fc3f94e02ade1ee1df419a')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/pc"
	cargo fetch --locked
}

build() {
	cd "$srcdir/$pkgname-$pkgver/pc"
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "pc/icon.png" -T "$pkgdir/usr/share/icons/$pkgname.png"
	install -Dm644 "pc/$pkgname.desktop" -T "$pkgdir/usr/share/applications/$pkgname.desktop"
}
