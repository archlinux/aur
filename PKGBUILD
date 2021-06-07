# Maintainer: tectonic-deploy <sasha+tectonic@hackafe.net>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

# The master version of this file is maintained here:
#
#   https://github.com/tectonic-typesetting/tectonic/blob/master/dist/arch/PKGBUILD.src.in
#
# The version on aur.archlinux.org is updated automatically by the Tectonic
# CI/CD system when new versions are released. Pull requests should be filed
# against Tectonic if the settings in this file need changing.

pkgname=tectonic
pkgver=0.5.1
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('f0493725f4355bd94176122990bcbd8b4362506a4353aca28157b1ad8f960df555ba70681a3edbbcaa08c3d20a9c5f340b6800c9857da3c6546487c21812cfce')

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked --features external-harfbuzz
}

check() {
	cd $pkgname-$pkgver
	cargo test --release --locked --features external-harfbuzz
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 ${CARGO_TARGET_DIR:-target}/release/tectonic "$pkgdir"/usr/bin/tectonic
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
