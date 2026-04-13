# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ShortArrow
_pkgname=runex
_cratename=${_pkgname}
_appname=runex
pkgname=${_cratename}
pkgdesc="Cross-shell abbreviation engine that expands short tokens into full commands"

pkgver=0.1.10
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'pkgconf')
depends=('glibc' 'libgcc' 'openssl')

provides=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download"
		"LICENSE")
sha256sums=('119f4ab08cc64f99cd2c6b772557e93f4c4221b716998ab87ff9a89ca82fa835'
            '19614dcc7dc2af82331a66d30ab79d5674be3ce73ef853ed76e1743b2830f4d0')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
