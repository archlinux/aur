# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Co-Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Ashton Bennet <ashtonquinn@disroot.org>

pkgname=humnumsort
_pkgname=hns
pkgver=0.2.0
pkgrel=1
pkgdesc='Human-sorts lines (i.e. x10\n comes after x1\n)'
provides=('hns' 'hns+' 'hxs')
makedepends=('cargo')
arch=('x86_64' 'armv6h' 'armv7h')
license=('Apache-2.0')
url='https://github.com/ctrlcctrlv/humnumsort'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5052b506ce892209f1832931f603f63d07f55dddb29ef7813f6a99d419c7590b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/bin"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/bin"
	install -Dm755 target/release/hns ${pkgdir}/usr/bin/hns
	ln -s /usr/bin/hns ${pkgdir}/usr/bin/hns+
	install -Dm644 ../README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
	install -Dm644 ../doc/hns.1.gz "${pkgdir}"/usr/share/man/man1/hns.1.gz
	ln -s /usr/share/man/man1/hns.1.gz "${pkgdir}"/usr/share/man/man1/hns+.1.gz
	ln -s /usr/share/man/man1/hns.1.gz "${pkgdir}"/usr/share/man/man1/hxs.1.gz
}

