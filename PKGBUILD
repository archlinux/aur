# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Maintainer: Jan Tojnar <jtojnar@gmail.com>

pkgname=tectonic
pkgver=0.1.9
pkgrel=1
arch=('x86_64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/en-US/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('ba47a761cabdc6ab483ef1e8ed19b78dd38ada983a2a18b01371a354c3d578f0c6e9d85960a9173f317094b96ba8668ef76a38d14239aa3b4d9472949c6cf14f')

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
