# Maintainer: tectonic-deploy <sasha+tectonic@hackafe.net>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

# The master version of this file is maintained here:
#
#   https://github.com/tectonic-typesetting/tectonic/blob/master/dist/arch/PKGBUILD.in
#
# The version on aur.archlinux.org is updated automatically by the Tectonic
# CI/CD system # when new versions are released.

pkgname=tectonic
pkgver=0.1.17
pkgrel=0
arch=('x86_64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('5603c18c6016faf5b6268ae48c961d2f7c92c935b8cd0f775c0da9e76eaa86d6dcc4f40c4604b04f8bf572fa1ebec522e341adefb1c5fcce4d2d7e4dd6cf29f7')

build() {
	cd $pkgname-$pkgver
	cargo build --release --target-dir "./target"
}

check() {
	cd $pkgname-$pkgver
	cargo test --release --target-dir "./target"
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 target/release/tectonic "$pkgdir"/usr/bin/tectonic
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
