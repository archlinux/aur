# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Maintainer: Jan Tojnar <jtojnar@gmail.com>

pkgname=tectonic
pkgver=0.1.8
pkgrel=1
arch=('x86_64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/en-US/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('fe2fe418b34f72285bc63c33ea75e8edb6c76ca10e50480d2b3df8d84ca45b33a9090e8df0cd4bf3e3e2c3f190689a1547e3fb976dec0a9ceffae89624954a4a')

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
