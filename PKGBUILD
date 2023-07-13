# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

pkgname="mission2teegarden-b"
pkgver="0.1.0"
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
sha512sums=('5f3b97382cb13b7cf41a9fec69fe8bafe910be0682e2f70b9a4c816370522860d60da2345d8db0abc43cb2b956d84c4229c60bc00dc0054280c5790ec85cdf14')

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
	#install -Dm644 "pc/icon.png" -T "$pkgdir/usr/share/icons/$pkgname.png"
	#install -Dm644 "pc/$pkgname.desktop" -T "$pkgdir/usr/share/applications/$pkgname.desktop"
}
