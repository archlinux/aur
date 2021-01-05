# Maintainer: Jeff Wright <jeff@teamjk.page>
pkgname=tab-rs
pkgver=0.5.4
epoch=1
pkgrel=1
pkgdesc="The intuitive config-driven terminal multiplexer"
arch=('x86_64')
url="https://github.com/austinjones/tab-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
provides=('tab-rs')
conflicts=('tab-rs-git' 'tab')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked --all-features
}

check() {
	cd $pkgname-$pkgver
	cargo test --release --locked
}

package() {
	cd $pkgname-$pkgver

	install -Dm 755 target/release/tab -t $pkgdir/usr/bin
	install -Dm 644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname

	install -Dm 644 tab/src/completions/bash/tab.bash $pkgdir/usr/share/bash-completion/completions/tab
	install -Dm 644 tab/src/completions/zsh/_tab $pkgdir/usr/share/zsh/site-functions/_tab
	install -Dm 644 tab/src/completions/fish/tab.fish $pkgdir/usr/share/fish/vendor_completions.d/tab.fish
}
md5sums=('e5fff539d4bdfe9b09da69828a6b9999')
