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
pkgver=0.3.0
pkgrel=0
arch=('x86_64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('2db8b36904623ad0705e641d40dc22c86d26b6e489b932171c5d67b691f4e96d467b85424c473c7605016037dcd3bb343ff210d5632e49a3073af252bf58f502')

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
