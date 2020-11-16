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
pkgver=0.3.3
pkgrel=0
arch=('x86_64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('81948f7a23155a09d9f6345f78096624a9039b1502f8b92b7b42926cd42eb9619f5c0170d6b27750c17fd7e8a96e68268691f8a8278fcf1365352d08b96f366b')

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
