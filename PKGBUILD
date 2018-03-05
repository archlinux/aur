# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Maintainer: Jan Tojnar <jtojnar@gmail.com>

pkgname=tectonic
pkgver=0.1.7
pkgrel=1
arch=('x86_64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/en-US/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/tectonic/0.1.7/download")
sha512sums=('b835563ddf43f346365f51a3d257c3b44073100934e1630d52e5f8ad20e49e35b227fd0f1f272a6037d4691d9b62a0294308b4338dcb090002fa47f4b399d326')

build() {
	cd $pkgname-$pkgver
	cargo build --release
}

check() {
	cd $pkgname-$pkgver
	cargo test --release
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 target/release/tectonic "$pkgdir"/usr/bin/tectonic
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
