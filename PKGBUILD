# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Co-Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Ashton Bennet <ashtonquinn@disroot.org>

pkgname=humnumsort
_pkgname=hns
pkgver=0.3.0
pkgrel=1
pkgdesc='Human-sorts lines (i.e. x10\n comes after x1\n)'
provides=('hns' 'hns+' 'hxs')
makedepends=('cargo')
arch=('x86_64' 'armv6h' 'armv7h')
license=('Apache-2.0')
url='https://github.com/ctrlcctrlv/humnumsort'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(05b4a10f2f083a2b2e61077a5a1765ddcd212423e36fda2ffc0ef48060cc64083d8321eea90876b08599a388454b3f225671b43fc2a14d08f6950d97b85ca367)

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

